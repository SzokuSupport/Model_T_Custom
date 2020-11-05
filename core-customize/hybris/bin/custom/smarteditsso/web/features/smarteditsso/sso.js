angular
    .module('ssoModule', [
        'authenticationInterfaceModule',
        'functionsModule',
        'smarteditCommonsModule',
        'resourceLocationsModule',
        'modalServiceModule',
        'ui.bootstrap',
        'yLoDashModule'
    ])
    .factory('httpAuthInterceptor', function($log, $injector, interceptorHelper) {
        return {
            request: function(config) {
                return interceptorHelper.handleRequest(config, function() {
                    return $injector.get("authenticationService").filterEntryPoints(config.url).then(function(entryPoints) {
                        if (entryPoints && entryPoints.length) {
                            $log.info("---------------sso url: " + entryPoints[0]);

                            return $injector.get("storageService").getValueFromCookie("SmarteditSSOToken", true).then(function(authToken) {
                                //$log.info("cookie value -->" + JSON.stringify(authToken));
                                if (authToken) {
                                    config.headers.Authorization = authToken.token_type + " " + authToken.access_token;
                                }
                                return config;
                            });

                            // return $injector.get("storageService").getAuthToken(entryPoints[0]).then(function(authToken) {
                            //     $log.debug(['Intercepting request ' + (authToken ? 'adding access token' : 'no access token found'), config.url].join(' '));
                            //     if (authToken) {
                            //         config.headers.Authorization = authToken.token_type + " " + authToken.access_token;
                            //     }
                            //     return config;
                            // });
                        } else {
                            return config;
                        }
                    }, function() {
                        return config;
                    });
                });
            }
        };
    })
    .config(function($httpProvider) {
        $httpProvider.interceptors.push('httpAuthInterceptor');
    })
    .factory('unauthorizedErrorInterceptor', function($log, $injector, $q, authenticationService, WHO_AM_I_RESOURCE_URI) {

        // var promisesToResolve = {}; // key: auth entry point, value: array of deferred
        var rejectedUrls = [
            WHO_AM_I_RESOURCE_URI
        ];
        var isUrlNotRejected = function(url) {
            return !rejectedUrls.some(function(rejectedUrl) {
                return url.indexOf(rejectedUrl) === 0;
            });
        };

        return {
            predicate: function(response) {
                return response.status === 401 && ((response.config && response.config.url) ? isUrlNotRejected(response.config.url) : true);
            },
            responseError: function(response) {
                $log.info("----------sso redirect to idp login---------------");

                var loc = window.location;
                var server = loc.protocol + '//' + loc.hostname + (loc.port ? ':' + loc.port : '');
                window.location.href = server + "/oidcsinglesignon/oidc/smartedit";


                var deferred = $q.defer();

                return deferred.promise.then(function() {
                    return $injector.get('$http')(response.config);
                });
            }
        };
    });
