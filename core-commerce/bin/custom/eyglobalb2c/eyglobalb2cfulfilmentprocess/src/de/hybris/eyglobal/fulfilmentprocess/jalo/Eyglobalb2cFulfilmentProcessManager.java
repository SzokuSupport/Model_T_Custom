/*
 * Copyright (c) 2019 SAP SE or an SAP affiliate company. All rights reserved.
 */
package de.hybris.eyglobal.fulfilmentprocess.jalo;

import de.hybris.platform.jalo.JaloSession;
import de.hybris.platform.jalo.extension.ExtensionManager;
import de.hybris.eyglobal.fulfilmentprocess.constants.Eyglobalb2cFulfilmentProcessConstants;

public class Eyglobalb2cFulfilmentProcessManager extends GeneratedEyglobalb2cFulfilmentProcessManager
{
	public static final Eyglobalb2cFulfilmentProcessManager getInstance()
	{
		ExtensionManager em = JaloSession.getCurrentSession().getExtensionManager();
		return (Eyglobalb2cFulfilmentProcessManager) em.getExtension(Eyglobalb2cFulfilmentProcessConstants.EXTENSIONNAME);
	}
	
}
