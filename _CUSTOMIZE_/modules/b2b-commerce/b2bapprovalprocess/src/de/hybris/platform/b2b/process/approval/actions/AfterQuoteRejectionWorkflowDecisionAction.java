/*
 * Copyright (c) 2019 SAP SE or an SAP affiliate company. All rights reserved.
 */
package de.hybris.platform.b2b.process.approval.actions;

import de.hybris.platform.b2b.event.QuoteRejectedEvent;
import de.hybris.platform.b2b.process.approval.jalo.B2BApprovalProcess;
import de.hybris.platform.b2b.process.approval.model.B2BApprovalProcessModel;
import de.hybris.platform.core.Registry;
import de.hybris.platform.core.model.order.OrderModel;
import de.hybris.platform.core.model.security.PrincipalModel;
import de.hybris.platform.jalo.security.Principal;
import de.hybris.platform.servicelayer.event.EventService;
import de.hybris.platform.workflow.jalo.WorkflowAction;
import org.apache.commons.collections.CollectionUtils;
import org.apache.commons.collections.PredicateUtils;


public class AfterQuoteRejectionWorkflowDecisionAction extends AfterRejectGenericWorkflowDecisionAction
{
	@Override
	public void performAction(final WorkflowAction action)
	{
		super.performAction(action);
		final Principal principalAssigned = action.getPrincipalAssigned();
		final B2BApprovalProcess process = (B2BApprovalProcess) CollectionUtils.find(action.getAttachmentItems(),
				PredicateUtils.instanceofPredicate(B2BApprovalProcess.class));
		final OrderModel order = ((B2BApprovalProcessModel) this.getModelService().toModelLayer(process)).getOrder();
		final EventService eventService = (EventService) Registry.getApplicationContext().getBean("eventService");
		eventService
				.publishEvent(new QuoteRejectedEvent(order, getModelService().<PrincipalModel> toModelLayer(principalAssigned)));
	}
}
