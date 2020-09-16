/*
 * Copyright (c) 2019 SAP SE or an SAP affiliate company. All rights reserved.
 */
package de.hybris.eyglobal.core.jalo;

import de.hybris.platform.jalo.JaloSession;
import de.hybris.platform.jalo.extension.ExtensionManager;
import de.hybris.eyglobal.core.constants.Eyglobalb2cCoreConstants;
import de.hybris.eyglobal.core.setup.CoreSystemSetup;


/**
 * Do not use, please use {@link CoreSystemSetup} instead.
 * 
 */
public class Eyglobalb2cCoreManager extends GeneratedEyglobalb2cCoreManager
{
	public static final Eyglobalb2cCoreManager getInstance()
	{
		final ExtensionManager em = JaloSession.getCurrentSession().getExtensionManager();
		return (Eyglobalb2cCoreManager) em.getExtension(Eyglobalb2cCoreConstants.EXTENSIONNAME);
	}
}
