/*
 * Copyright (c) 2019 SAP SE or an SAP affiliate company. All rights reserved.
 */
package org.eyglobalb2b.fulfilmentprocess.jalo;

import de.hybris.platform.jalo.JaloSession;
import de.hybris.platform.jalo.extension.ExtensionManager;
import org.eyglobalb2b.fulfilmentprocess.constants.Eyglobalb2bFulfilmentProcessConstants;

public class Eyglobalb2bFulfilmentProcessManager extends GeneratedEyglobalb2bFulfilmentProcessManager
{
	public static final Eyglobalb2bFulfilmentProcessManager getInstance()
	{
		ExtensionManager em = JaloSession.getCurrentSession().getExtensionManager();
		return (Eyglobalb2bFulfilmentProcessManager) em.getExtension(Eyglobalb2bFulfilmentProcessConstants.EXTENSIONNAME);
	}
	
}
