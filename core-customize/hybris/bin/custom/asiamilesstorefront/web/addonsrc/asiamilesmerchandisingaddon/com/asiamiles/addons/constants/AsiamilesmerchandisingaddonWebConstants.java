/*
 * [y] hybris Platform
 *
 * Copyright (c) 2018 SAP SE or an SAP affiliate company.  All rights reserved.
 *
 * This software is the confidential and proprietary information of SAP
 * ("Confidential Information"). You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the
 * license agreement you entered into with SAP.
 */
package com.asiamiles.addons.constants;

import com.asiamiles.addons.model.AmlMerchandisingCarouselComponentModel;
import com.asiamiles.core.model.components.AMLParagraphComponentModel;

/**
 * Global class for all Asiamilesmerchandisingaddon web constants. You can add global constants for your extension into this class.
 */
public final class AsiamilesmerchandisingaddonWebConstants // NOSONAR
{

	String _Prefix = "/view/"; // NOSONAR
	String _Suffix = "Controller"; // NOSONAR

	 String AmlMerchandisingCarouselComponent = _Prefix + AmlMerchandisingCarouselComponentModel._TYPECODE + _Suffix; // NOSONAR

	private AsiamilesmerchandisingaddonWebConstants()
	{
		//empty to avoid instantiating this constant class
	}

	// implement here constants used by this extension
}
