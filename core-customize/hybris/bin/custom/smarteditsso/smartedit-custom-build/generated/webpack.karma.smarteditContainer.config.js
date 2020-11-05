module.exports = {
    "devtool": "source-map",
    "externals": {
        "jasmine": "jasmine",
        "testutils": "testutils",
        "angular-mocks": "angular-mocks",
        "angular": "angular",
        "lodash": "lodash",
        "angular-route": "angular-route",
        "angular-translate": "angular-translate",
        "crypto-js": "CryptoJS",
        "Reflect": "Reflect",
        "moment": "moment",
        "smarteditcommons": "smarteditcommons"
    },
    "output": {
        "path": "\u002Fopt\u002Fworkspace\u002Fbuild\u002Fcustomer-project\u002Fcustom\u002Fsap-cx\u002Fsmarteditsso\u002FjsTarget",
        "filename": "[name].js",
        "sourceMapFilename": "[file].map"
    },
    "resolve": {
        "modules": [
            "\u002Fopt\u002Fworkspace\u002Fbuild\u002Fcustomer-project\u002Fcustom\u002Fsap-cx\u002Fsmarteditsso\u002Fnode_modules",
            "\u002Fopt\u002Fworkspace\u002Fbuild\u002Fcustomer-project\u002Fcustom\u002Fsap-cx\u002Fsmarteditsso\u002FjsTarget\u002Fweb\u002Fapp",
            "\u002Fopt\u002Fworkspace\u002Fbuild\u002Fcustomer-project\u002Fcustom\u002Fsap-cx\u002Fsmarteditsso\u002FjsTarget\u002Fweb\u002Ffeatures",
            "\u002Fopt\u002Fworkspace\u002Fbuild\u002Fcustomer-project\u002Fcustom\u002Fsap-cx\u002Fsmarteditsso\u002Fsmartedit-build\u002Ftest\u002Funit"
        ],
        "extensions": [
            ".ts",
            ".js"
        ],
        "alias": {
            "testhelpers": "\u002Fopt\u002Fworkspace\u002Fbuild\u002Fcustomer-project\u002Fcustom\u002Fsap-cx\u002Fsmarteditsso\u002Fsmartedit-build\u002Ftest\u002Funit",
            "smarteditssocommons": "\u002Fopt\u002Fworkspace\u002Fbuild\u002Fcustomer-project\u002Fcustom\u002Fsap-cx\u002Fsmarteditsso\u002FjsTarget\u002Fweb\u002Ffeatures\u002Fsmarteditssocommons",
            "smarteditssocontainer": "\u002Fopt\u002Fworkspace\u002Fbuild\u002Fcustomer-project\u002Fcustom\u002Fsap-cx\u002Fsmarteditsso\u002FjsTarget\u002Fweb\u002Ffeatures\u002FsmarteditssoContainer"
        }
    },
    "module": {
        "rules": [{
                "test": /\.ts$/,
                "sideEffects": true,
                "use": [{
                    "loader": "awesome-typescript-loader",
                    "options": {
                        "configFileName": "\u002Fopt\u002Fworkspace\u002Fbuild\u002Fcustomer-project\u002Fcustom\u002Fsap-cx\u002Fsmarteditsso\u002Fsmartedit-custom-build\u002Fgenerated\u002Ftsconfig.karma.smarteditContainer.json"
                    }
                }]
            },
            {
                "test": /\.ts$/,
                "exclude": /smartedit-build|Test\.ts$/,
                "loader": "istanbul-instrumenter-loader",
                "enforce": "post",
                "options": {
                    "esModules": true,
                    "preserveComments": true,
                    "produceSourceMap": true
                }
            }
        ]
    },
    "performance": {
        "hints": false
    },
    "stats": {
        "colors": true,
        "modules": true,
        "reasons": true,
        "errorDetails": true
    },
    "plugins": [{
            "apply": function(compiler) {
                const KarmaErrorsPlugin = function() {};
                KarmaErrorsPlugin.prototype.apply = function(compiler) {
                    compiler.hooks.done.tap('KarmaErrorsPlugin', (stats) => {
                        if (stats.compilation.errors.length && process.argv.indexOf('--watch') === -1) {
                            stats.compilation.errors.forEach(function(error) {
                                console.error(`ERROR in ${error.message || error}`);
                            });
                            process.exit(1);
                        }
                    });
                };
                return new KarmaErrorsPlugin().apply(compiler);
            }
        },
        {
            "apply": function(compiler) {
                const ModuleDependencyWarning = require("webpack/lib/ModuleDependencyWarning");
                const messageRegExp = /export '.*'( \(reexported as '.*'\))? was not found in/;

                function doneHook(stats) {
                    stats.compilation.warnings = stats.compilation.warnings.filter(function(warn) {
                        if (warn instanceof ModuleDependencyWarning && messageRegExp.test(warn.message)) {
                            return false;
                        }
                        return true;
                    });
                }
                if (compiler.hooks) {
                    compiler.hooks.done.tap("IgnoreNotFoundExportPlugin", doneHook);
                } else {
                    compiler.plugin("done", doneHook);
                }
            }
        },
        {
            "options": {
                "add": true,
                "sourceMap": true
            },
            "apply": function(compiler) {
                const ngAnnotatePlugin = require('ng-annotate-webpack-plugin');
                return new ngAnnotatePlugin({
                    add: true,
                    sourceMap: true
                }).apply(compiler);
            }
        }
    ],
    "bail": true,
    "mode": "development"
};
