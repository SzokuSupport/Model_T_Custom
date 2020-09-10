/*
 * Copyright (c) 2019 SAP SE or an SAP affiliate company. All rights reserved.
 */
package org.eyglobalb2b.fulfilmentprocess.actions.consignment;

import de.hybris.platform.ordersplitting.model.ConsignmentProcessModel;
import de.hybris.platform.processengine.BusinessProcessService;
import de.hybris.platform.processengine.action.AbstractProceduralAction;
import org.eyglobalb2b.fulfilmentprocess.constants.Eyglobalb2bFulfilmentProcessConstants;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Required;


/**
 *
 */
public class SubprocessEndAction extends AbstractProceduralAction<ConsignmentProcessModel>
{
	private static final Logger LOG = Logger.getLogger(SubprocessEndAction.class);

	private static final String PROCESS_MSG = "Process: ";

	private BusinessProcessService businessProcessService;

	protected BusinessProcessService getBusinessProcessService()
	{
		return businessProcessService;
	}

	@Required
	public void setBusinessProcessService(final BusinessProcessService businessProcessService)
	{
		this.businessProcessService = businessProcessService;
	}

	@Override
	public void executeAction(final ConsignmentProcessModel process)
	{
		LOG.info(PROCESS_MSG + process.getCode() + " in step " + getClass());

		try
		{
			// simulate different ending times
			Thread.sleep((long) (Math.random() * 2000));
		}
		catch (final InterruptedException e)
		{
			// can't help it
		}

		process.setDone(true);

		save(process);
		LOG.info(PROCESS_MSG + process.getCode() + " wrote DONE marker");

		getBusinessProcessService().triggerEvent(
				process.getParentProcess().getCode() + "_"
						+ Eyglobalb2bFulfilmentProcessConstants.CONSIGNMENT_SUBPROCESS_END_EVENT_NAME);
		LOG.info(PROCESS_MSG + process.getCode() + " fired event "
				+ Eyglobalb2bFulfilmentProcessConstants.CONSIGNMENT_SUBPROCESS_END_EVENT_NAME);
	}
}
