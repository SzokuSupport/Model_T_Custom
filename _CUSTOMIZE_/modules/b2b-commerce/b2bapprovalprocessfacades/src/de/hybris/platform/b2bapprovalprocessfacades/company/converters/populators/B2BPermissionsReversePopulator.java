/*
 * Copyright (c) 2019 SAP SE or an SAP affiliate company. All rights reserved.
 */
package de.hybris.platform.b2bapprovalprocessfacades.company.converters.populators;

import static de.hybris.platform.servicelayer.util.ServicesUtil.validateParameterNotNull;

import de.hybris.platform.b2b.model.B2BCustomerModel;
import de.hybris.platform.b2b.model.B2BOrderThresholdPermissionModel;
import de.hybris.platform.b2b.model.B2BOrderThresholdTimespanPermissionModel;
import de.hybris.platform.b2b.model.B2BPermissionModel;
import de.hybris.platform.b2b.model.B2BUnitModel;
import de.hybris.platform.b2b.services.B2BUnitService;
import de.hybris.platform.b2bapprovalprocessfacades.company.data.B2BPermissionData;
import de.hybris.platform.converters.Populator;
import de.hybris.platform.core.model.c2l.CurrencyModel;
import de.hybris.platform.servicelayer.dto.converter.ConversionException;
import de.hybris.platform.servicelayer.i18n.CommonI18NService;

import org.springframework.beans.factory.annotation.Required;


/**
 * Populates {@link B2BPermissionData} with {@link B2BPermissionModel}.
 */
public class B2BPermissionsReversePopulator implements Populator<B2BPermissionData, B2BPermissionModel>
{
	private B2BUnitService<B2BUnitModel, B2BCustomerModel> b2BUnitService;
	private CommonI18NService commonI18NService;

	@Override
	public void populate(final B2BPermissionData source, final B2BPermissionModel target) throws ConversionException
	{
		validateParameterNotNull(source, "Parameter source cannot be null.");
		validateParameterNotNull(target, "Parameter target cannot be null.");

		target.setCode(source.getCode());

		final B2BUnitModel b2BUnitModel = getB2BUnitService().getUnitForUid(source.getUnit().getUid());
		target.setUnit(b2BUnitModel);

		if (target instanceof B2BOrderThresholdPermissionModel)
		{
			((B2BOrderThresholdPermissionModel) target).setThreshold(source.getValue());

			final CurrencyModel currencyModel = getCommonI18NService().getCurrency(source.getCurrency().getIsocode());
			((B2BOrderThresholdPermissionModel) target).setCurrency(currencyModel);

			if (target instanceof B2BOrderThresholdTimespanPermissionModel)
			{
				((B2BOrderThresholdTimespanPermissionModel) target).setRange(source.getPeriodRange());
			}
		}

	}

	protected B2BUnitService<B2BUnitModel, B2BCustomerModel> getB2BUnitService()
	{
		return b2BUnitService;
	}

	@Required
	public void setB2BUnitService(final B2BUnitService<B2BUnitModel, B2BCustomerModel> b2bUnitService)
	{
		b2BUnitService = b2bUnitService;
	}

	protected CommonI18NService getCommonI18NService()
	{
		return commonI18NService;
	}

	@Required
	public void setCommonI18NService(final CommonI18NService commonI18NService)
	{
		this.commonI18NService = commonI18NService;
	}
}
