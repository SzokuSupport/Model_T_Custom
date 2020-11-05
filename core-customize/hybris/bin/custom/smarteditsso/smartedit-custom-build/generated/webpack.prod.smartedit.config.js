module.exports = {
    "devtool": "none",
    "externals": {
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
            "\u002Fopt\u002Fworkspace\u002Fbuild\u002Fcustomer-project\u002Fcustom\u002Fsap-cx\u002Fsmarteditsso\u002FjsTarget\u002Fweb\u002Ffeatures"
        ],
        "extensions": [
            ".ts",
            ".js"
        ],
        "alias": {
            "smarteditssocommons": "\u002Fopt\u002Fworkspace\u002Fbuild\u002Fcustomer-project\u002Fcustom\u002Fsap-cx\u002Fsmarteditsso\u002FjsTarget\u002Fweb\u002Ffeatures\u002Fsmarteditssocommons",
            "smarteditsso": "\u002Fopt\u002Fworkspace\u002Fbuild\u002Fcustomer-project\u002Fcustom\u002Fsap-cx\u002Fsmarteditsso\u002FjsTarget\u002Fweb\u002Ffeatures\u002Fsmarteditsso"
        }
    },
    "module": {
        "rules": [{
            "test": /\.ts$/,
            "sideEffects": true,
            "use": [{
                "loader": "awesome-typescript-loader",
                "options": {
                    "configFileName": "\u002Fopt\u002Fworkspace\u002Fbuild\u002Fcustomer-project\u002Fcustom\u002Fsap-cx\u002Fsmarteditsso\u002Fsmartedit-custom-build\u002Fgenerated\u002Ftsconfig.prod.smartedit.json"
                }
            }]
        }]
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
    "mode": "production",
    "optimization": {
        "minimizer": [{
            "apply": function(compiler) {
                const UglifyJSPlugin = require('uglifyjs-webpack-plugin');
                return new UglifyJSPlugin({
                    uglifyOptions: {
                        sourceMap: true,
                        keep_classnames: true,
                        keep_fnames: true
                    }
                }).apply(compiler);
            }
        }],
        "minimize": true
    },
    "entry": {
        "smarteditsso": ".\u002FjsTarget\u002Fweb\u002Ffeatures\u002Fsmarteditsso\u002FsmarteditssoModule.ts"
    }
};
