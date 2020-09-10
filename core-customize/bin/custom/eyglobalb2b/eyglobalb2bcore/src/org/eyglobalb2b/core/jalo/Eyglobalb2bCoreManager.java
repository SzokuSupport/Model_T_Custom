/*
 * Copyright (c) 2019 SAP SE or an SAP affiliate company. All rights reserved.
 */
package org.eyglobalb2b.core.jalo;

import de.hybris.platform.jalo.JaloSession;
import de.hybris.platform.jalo.extension.ExtensionManager;
import org.eyglobalb2b.core.constants.Eyglobalb2bCoreConstants;
import org.eyglobalb2b.core.setup.CoreSystemSetup;


/**
 * Do not use, please use {@link CoreSystemSetup} instead.
 * 
 */
public class Eyglobalb2bCoreManager extends GeneratedEyglobalb2bCoreManager
{
	public static final Eyglobalb2bCoreManager getInstance()
	{
		final ExtensionManager em = JaloSession.getCurrentSession().getExtensionManager();
		return (Eyglobalb2bCoreManager) em.getExtension(Eyglobalb2bCoreConstants.EXTENSIONNAME);
	}
}
