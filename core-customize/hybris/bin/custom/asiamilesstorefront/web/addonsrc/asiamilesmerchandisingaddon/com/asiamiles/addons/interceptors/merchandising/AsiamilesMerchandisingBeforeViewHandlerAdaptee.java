package com.asiamiles.addons.interceptors.merchandising;

import com.hybris.merchandising.constants.MerchandisingConstants;
import com.hybris.merchandising.context.ContextService;
import com.hybris.merchandising.interceptors.HybrisMerchandisingBeforeViewHandlerAdaptee;
import com.hybris.merchandising.model.ContextMap;
import de.hybris.platform.acceleratorservices.data.RequestContextData;
import de.hybris.platform.category.model.CategoryModel;
import de.hybris.platform.cms2.model.pages.ContentPageModel;
import de.hybris.platform.cms2.model.pages.ProductPageModel;
import de.hybris.platform.core.model.product.ProductModel;
import de.hybris.platform.servicelayer.config.ConfigurationService;
import de.hybris.platform.servicelayer.session.Session;
import de.hybris.platform.servicelayer.session.SessionService;
import org.apache.commons.collections.CollectionUtils;
import org.apache.log4j.Logger;
import org.springframework.ui.ModelMap;

import java.io.Serializable;
import java.util.Collection;
import java.util.Iterator;


public class AsiamilesMerchandisingBeforeViewHandlerAdaptee
                    extends HybrisMerchandisingBeforeViewHandlerAdaptee
{
    private static final Logger LOG = Logger.getLogger(AsiamilesMerchandisingBeforeViewHandlerAdaptee.class);

    protected static final String PRODUCT_PAGE_DATA = "productPageData";
    private static final String SEARCH_PAGE_DATA = "searchPageData";
    private static final String CMSPAGE = "cmsPage";

    private Boolean isUsingMasterCategoryContext = Boolean.FALSE;

    protected SessionService sessionService;
    protected ContextService contextService;
    protected ConfigurationService configurationService;

    @Override
    protected void storeCategory(RequestContextData requestContextData, Session currentSession, ModelMap model) {

        final Object currentPageObject = model.get(CMSPAGE);

         //  Check currentPageObject if Product Page
        if (currentPageObject instanceof ProductPageModel)
        {
            storeProductCategory(requestContextData, currentSession);
        }
    }


    private void storeProductCategory(final RequestContextData requestContextData, final Session currentSession)
    {
        /**
         * Add the list of selected facets to the session for later retrieval
         */
        if (requestContextData != null && requestContextData.getProduct() != null)
        {
            final ProductModel productModel = requestContextData.getProduct();


            if ( getUsingMasterCategoryContext() && productModel.getMasterCategory()  != null )
            {
                currentSession.setAttribute(MerchandisingConstants.PAGE_CONTEXT_CATEGORY,
                        productModel.getMasterCategory().getCode());
                storeContextualData(MerchandisingConstants.PAGE_CONTEXT_CATEGORY,
                        productModel.getMasterCategory().getCode());
            }
            else
            {

                Collection<CategoryModel> categoriesSet = productModel.getSupercategories();

                if (CollectionUtils.isNotEmpty( categoriesSet ))
                {
                    CategoryModel cm = categoriesSet.iterator().next();

                    // Retrieve T2 Category
                    if ( cm.getCode().startsWith("t2"))
                    {
                        currentSession.setAttribute(MerchandisingConstants.PAGE_CONTEXT_CATEGORY, cm.getCode());
                        storeContextualData(MerchandisingConstants.PAGE_CONTEXT_CATEGORY, cm.getCode());
                    }
                    else
                    {
                        Collection<CategoryModel> superCategoriesSet  = cm.getSupercategories();
                        if (CollectionUtils.isNotEmpty( superCategoriesSet )) {
                            CategoryModel targetCategory = getParentCategory( superCategoriesSet);
                            if ( targetCategory != null )
                            {
                                currentSession.setAttribute(MerchandisingConstants.PAGE_CONTEXT_CATEGORY,
                                        targetCategory.getCode());
                                storeContextualData(MerchandisingConstants.PAGE_CONTEXT_CATEGORY,
                                        targetCategory.getCode());
                            }
                        }
                    }
                }
            }
        }
    }

    private CategoryModel getParentCategory(Collection<CategoryModel> superCategoriesSet)
    {
        if (CollectionUtils.isNotEmpty( superCategoriesSet )) {
            Iterator<CategoryModel> caetIt =  superCategoriesSet.iterator();
            do {
                CategoryModel superCategory = caetIt.next();
                if (superCategory.getCode().startsWith("t2")) {
                    return superCategory;
                }else if ( superCategory.getCode().startsWith("main") ||
                        superCategory.getCode().startsWith("brand"))
                {
                    continue;
                }
                else
                {
                    return getParentCategory(superCategory.getSupercategories());
                }
            }while ( caetIt.hasNext());
        }
        return null;
    }

    private void storeContextualData(final String propertyName, final Serializable propertyValue)
    {
        com.hybris.merchandising.model.ContextMap contextMap = new com.hybris.merchandising.model.ContextMap();
        contextMap.addProperty(propertyName, propertyValue);
        contextService.getContextRepository().put(propertyName, contextMap);
    }


	public void setSessionService(SessionService sessionService) {
		super.setSessionService(sessionService);
		this.sessionService = sessionService;
	}


	public void setContextService(ContextService contextService) {
		super.setContextService(contextService);
		this.contextService = contextService;
	}

	public boolean getUsingMasterCategoryContext()
    {
        return getConfigurationService().getConfiguration()
                .getBoolean("asiamiles.cds.context.productcategory.usemastercategory", false);
    }

    public ConfigurationService getConfigurationService() {
        return configurationService;
    }

    public void setConfigurationService(ConfigurationService configurationService) {
        this.configurationService = configurationService;
    }
}
