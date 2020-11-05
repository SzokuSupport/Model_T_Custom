package com.asiamiles.storefront.addons.controllers.cms.controllers;

import de.hybris.platform.acceleratorfacades.productcarousel.ProductCarouselFacade;
import de.hybris.platform.addonsupport.controllers.cms.AbstractCMSAddOnComponentController;
import de.hybris.platform.commercefacades.product.ProductFacade;
import de.hybris.platform.commercefacades.product.ProductOption;
import de.hybris.platform.commercefacades.product.data.ProductData;
import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.ruleengineservices.enums.RuleStatus;
import de.hybris.platform.servicelayer.exceptions.ModelNotFoundException;
import de.hybris.platform.servicelayer.exceptions.UnknownIdentifierException;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import de.hybris.platform.servicelayer.session.SessionService;
import org.apache.commons.collections4.CollectionUtils;
import org.apache.commons.lang3.StringUtils;
import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.asiamiles.addons.model.AmlMerchandisingCarouselComponentModel;
import com.asiamiles.services.merchandising.MerchandisingStrategiesService;
import com.hybris.merchandising.constants.MerchandisingConstants;
import com.hybris.merchandising.context.ContextService;
import com.hybris.merchandising.model.ContextMap;

@Controller ("AmlMerchandisingCarouselComponentController")
@RequestMapping (value = "/view/AmlMerchandisingCarouselComponentController")
public class AmlMerchandisingCarouselComponentController
extends AbstractCMSAddOnComponentController <AmlMerchandisingCarouselComponentModel>
{

	private final static Logger LOG = Logger.getLogger(AmlMerchandisingCarouselComponentController.class);

	@Resource(name = "productCarouselFacade")
	private ProductCarouselFacade productCarouselFacade;

	@Resource (name = "productFacade" )
	private ProductFacade productFacade;

	@Resource (name = "merchandisingStrategiesService")
	private MerchandisingStrategiesService merchandisingStrategiesService;


	@Resource (name = "sessionService" )
	private SessionService sessionService;

	@Override
	protected void fillModel ( final HttpServletRequest request,
			final Model model,
			final AmlMerchandisingCarouselComponentModel component)
	{
		final List<ProductData> products = new ArrayList<>();

		products.addAll(collectMerchandisingProduct(component));
		model.addAttribute("title", component.getTitle());
		model.addAttribute("productData", products);

	}

	protected static final List<ProductOption> PRODUCT_OPTIONS = new ArrayList<>(Arrays.asList(ProductOption.VARIANT_FIRST_VARIANT, ProductOption.BASIC,
			ProductOption.URL, ProductOption.PRICE, ProductOption.SUMMARY, ProductOption.DESCRIPTION, ProductOption.GALLERY,
			ProductOption.CATEGORIES, ProductOption.REVIEW, ProductOption.PROMOTIONS, ProductOption.CLASSIFICATION,
			ProductOption.VARIANT_FULL, ProductOption.STOCK, ProductOption.VOLUME_PRICES, ProductOption.PRICE_RANGE,
			ProductOption.DELIVERY_MODE_AVAILABILITY));

	protected List<ProductData> collectMerchandisingProduct(final AmlMerchandisingCarouselComponentModel component) {

		String categoryId = this.sessionService.getCurrentSession().getAttribute(MerchandisingConstants.PAGE_CONTEXT_CATEGORY);

		if (StringUtils.isBlank( categoryId )) {
			categoryId = null;
		}

		if (LOG.isDebugEnabled()) {
			LOG.debug("for componentId: " + component.getUid() + "CategoryContext: " + categoryId);
		}

		List<String> productIds = new ArrayList<>(10);
		try
		{
			productIds = getMerchandisingStrategiesService().getMerchandisingProductList(component.getStrategy(), categoryId);
			if (LOG.isDebugEnabled())
			{
				LOG.debug("for componentId: " + component.getUid() + " Retrieve from CDS : " + Arrays.toString(productIds.toArray()));
			}
		}
		catch (final Throwable throwable)
		{
			if (LOG.isDebugEnabled())
			{
				LOG.warn("Error while trying to get CDS connection: ", throwable);
			}

		}

		final List<ProductData> products = new ArrayList<>();
		for(final String productId :  productIds)
		{
			try
			{
				final ProductData productData =
						getProductFacade().getProductForCodeAndOptions(productId, PRODUCT_OPTIONS);

				if ( CollectionUtils.isNotEmpty( productData.getPotentialBonusRules() )) {
					productData.setHavePublishedPotentialBonusRules(
							productData.getPotentialBonusRules().stream().anyMatch(
									p -> p.getStatus().equals(RuleStatus.PUBLISHED)) ? Boolean.TRUE : Boolean.FALSE);
				}
				else
				{
					productData.setHavePublishedPotentialBonusRules(Boolean.FALSE);
				}
				
				// Verify if this product is allowed for this customer
				if (productData.getPurchasable() && !productData.getShouldBeHidden())
				{
					products.add( productData );
				}
				else
				{
					if (LOG.isDebugEnabled()) {
						LOG.debug("for componentId: " + component.getUid() +
								" Product get filtered : " +   productData.getCode() +
								"as sellable is " + productData.getPurchasable() );
					}
				}
			} catch (UnknownIdentifierException| ModelNotFoundException exception)
			{
				// Ignore exception
			}
		}


		// Check if there is pre-set product for supplementaory list, if so,
		// we fill up the remaining product from the list.
		if ( products.size() < component.getNumberToDisplay() && // Check If the filtered product size is less than target display amount
				CollectionUtils.isNotEmpty( component.getProducts() )) // Check if supplementary product list has been set.
		{
			for ( int i = 0; products.size() < component.getNumberToDisplay() && i < component.getProducts().size(); i++)
			{
				ProductModel productModel =  component.getProducts().get(i);
				final ProductData productData =
						getProductFacade().getProductForCodeAndOptions( productModel.getCode(), PRODUCT_OPTIONS );
				products.add( productData );
			}
		}

		return products;

	}

	public ProductFacade getProductFacade() {
		return this.productFacade;
	}

	public void setProductFacade(final ProductFacade productFacade) {
		this.productFacade = productFacade;
	}

	public ProductCarouselFacade getProductCarouselFacade() {
		return this.productCarouselFacade;
	}

	public void setProductCarouselFacade(final ProductCarouselFacade productCarouselFacade) {
		this.productCarouselFacade = productCarouselFacade;
	}

	public MerchandisingStrategiesService getMerchandisingStrategiesService() {
		return this.merchandisingStrategiesService;
	}

	public void setMerchandisingStrategiesService(final MerchandisingStrategiesService merchandisingStrategiesService) {
		this.merchandisingStrategiesService = merchandisingStrategiesService;
	}
}
