/*
 * Copyright (c) 2019 SAP SE or an SAP affiliate company. All rights reserved.
 */
package de.hybris.platform.b2bcommercefacades.company.converters.populators;

import static de.hybris.platform.servicelayer.util.ServicesUtil.validateParameterNotNull;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Required;

import de.hybris.platform.b2b.model.B2BBudgetModel;
import de.hybris.platform.b2b.model.B2BCostCenterModel;
import de.hybris.platform.b2bcommercefacades.company.data.B2BBudgetData;
import de.hybris.platform.b2bcommercefacades.company.data.B2BCostCenterData;
import de.hybris.platform.b2bcommercefacades.company.data.B2BUnitData;
import de.hybris.platform.commercefacades.storesession.data.CurrencyData;
import de.hybris.platform.commercefacades.user.data.AddressData;
import de.hybris.platform.converters.Converters;
import de.hybris.platform.converters.Populator;
import de.hybris.platform.core.model.c2l.CurrencyModel;
import de.hybris.platform.core.model.user.AddressModel;
import de.hybris.platform.servicelayer.dto.converter.Converter;


/**
 * Populator implementation for {@link B2BCostCenterModel} as source and
 * {@link de.hybris.platform.b2bcommercefacades.company.data.B2BCostCenterData} as target type.
 */
public class B2BCostCenterPopulator implements Populator<B2BCostCenterModel, B2BCostCenterData>
{
	private Converter<B2BBudgetModel, B2BBudgetData> b2bBudgetConverter;
	private Converter<CurrencyModel, CurrencyData> currencyConverter;
	private Converter<AddressModel, AddressData> addressConverter;

	@Override
	public void populate(final B2BCostCenterModel source, final B2BCostCenterData target)
	{
		validateParameterNotNull(source, "Parameter source cannot be null.");
		validateParameterNotNull(target, "Parameter target cannot be null.");

		target.setCode(source.getCode());
		target.setName(source.getName());

		if (source.getCurrency() != null)
		{
			target.setCurrency(this.getCurrencyConverter().convert(source.getCurrency()));
		}
		if (source.getUnit() != null)
		{
			final B2BUnitData b2BUnitData = new B2BUnitData();
			b2BUnitData.setUid(source.getUnit().getUid());
			b2BUnitData.setName(source.getUnit().getLocName());
			b2BUnitData.setActive(Boolean.TRUE.equals(source.getUnit().getActive()));

			final List<AddressData> addresses = new ArrayList<AddressData>();
			for (final AddressModel addressModel : source.getUnit().getAddresses())
			{
				final AddressData addressData = this.getAddressConverter().convert(addressModel);
				addresses.add(addressData);
			}
			b2BUnitData.setAddresses(addresses);

			target.setUnit(b2BUnitData);
		}

		target.setActive(source.getActive().booleanValue());
		target.setB2bBudgetData(Converters.convertAll(source.getBudgets(), getB2bBudgetConverter()));
	}

	protected Converter<B2BBudgetModel, B2BBudgetData> getB2bBudgetConverter()
	{
		return b2bBudgetConverter;
	}

	@Required
	public void setB2bBudgetConverter(final Converter<B2BBudgetModel, B2BBudgetData> b2bBudgetConverter)
	{
		this.b2bBudgetConverter = b2bBudgetConverter;
	}

	protected Converter<CurrencyModel, CurrencyData> getCurrencyConverter()
	{
		return currencyConverter;
	}

	@Required
	public void setCurrencyConverter(final Converter<CurrencyModel, CurrencyData> currencyConverter)
	{
		this.currencyConverter = currencyConverter;
	}

	@Required
	public void setAddressConverter(final Converter<AddressModel, AddressData> addressConverter)
	{
		this.addressConverter = addressConverter;
	}

	protected Converter<AddressModel, AddressData> getAddressConverter()
	{
		return addressConverter;
	}
}