/*
 * [y] hybris Platform
 *
 * Copyright (c) 2018 SAP SE or an SAP affiliate company. All rights reserved.
 *
 * This software is the confidential and proprietary information of SAP
 * ("Confidential Information"). You shall not disclose such Confidential
 * Information and shall use it only in accordance with the terms of the
 * license agreement you entered into with SAP.
 */
import {doImport} from './forcedImports';
doImport();
import {SeModule} from 'smarteditcommons';
/**
 * @ngdoc overview
 * @name smarteditssoContainer
 * @description
 * Placeholder for documentation
 */
@SeModule({
	imports: [
		'ssoContainerModule'
	],
	initialize: () => {
		'ngInject';
	}
})
export class SmarteditssoContainer {}
