const webpackConfig = require('./webpack.config');
const publicPath = require('./webpack/config').publicPath;
const distFolder = {
  production: 'release',
  dev: 'dev',
  qa: 'qa'
}[process.env.NODE_ENV] || 'dev'

module.exports = function (grunt) {
  // Project configuration.
  grunt.initConfig({
    pkg: grunt.file.readJSON('package.json'),
    clean: {
      build: {
        src: [
          `dist/${distFolder}`
        ]
      }
    },
    webpack: {
      options: {
        stats: !process.env.NODE_ENV || process.env.NODE_ENV === 'development'
      },
      release: webpackConfig,
      dev: Object.assign({
        watch: false
      }, webpackConfig)
    },
    watch: {
      files: ['WEB-INF/**/*.*'],
      tasks: ['clean:build', 'sass:dev', `webpack:${distFolder}`, 'cssmin', `copy:${process.env.NODE_ENV}`]
    },
    svgstore: {
      options: {
        includedemo: true,
        includeTitleElement: false
      },
      dev: {
        src: ['WEB-INF/_ui-src/responsive/aml/svg/sprite/*.svg'],
        dest: `WEB-INF/_ui-src/responsive/aml/img/sprite.svg`,
      }
    },
    copy: {
      dev: {
        files: [
          // {expand: true, cwd: 'dist/dev/js/', src: ['**'], dest: '../WEB-INF/_ui-src/responsive/aml/js/'},
          // {expand: true, cwd: 'dist/dev/css/', src: ['**'], dest: '../WEB-INF/_ui-src/responsive/aml/css/'},
          // {expand: true, cwd: `dist/dev/${publicPath}/css/`, src: ['**'], dest: '../_ui/responsive/aml/css/'},
          {
            expand: true,
            cwd: `dist/dev/${publicPath}/pages/`,
            src: ['**'],
            dest: '../WEB-INF/views/responsive/pages/'
          },
          {
            expand: true,
            cwd: 'WEB-INF/_ui-src/responsive/aml/img/',
            src: ['**/*'],
            dest: `dist/dev/${publicPath}/img/`
          },
          {
            expand: true,
            cwd: 'WEB-INF/_ui-src/responsive/aml/fonts/',
            src: ['**/*'],
            dest: `dist/dev/${publicPath}/fonts/`
          },
          // html demo
          {
            expand: true,
            cwd: 'WEB-INF/_ui-src/responsive/aml/img/',
            src: ['**/*'],
            dest: `../_ui/responsive/aml/img/`
          },
          {
            expand: true,
            cwd: 'WEB-INF/_ui-src/responsive/aml/fonts/',
            src: ['**/*'],
            dest: `../_ui/responsive/aml/fonts/`
          },
          {
            expand: true,
            cwd: `dist/dev/${publicPath}/`,
            src: ['**'],
            dest: '../_ui/responsive/aml/'
          },
        ],
      },
      prod: {
        files: [{
          expand: true,
          cwd: `dist/release/${publicPath}/pages/`,
          src: ['**'],
          dest: '../WEB-INF/views/responsive/pages/'
        }],
      },
    },
    sass: {
      dev: {
        options: {
          compress: false
        },
        files: [{
          expand: true,
          cwd: 'WEB-INF/_ui-src/responsive/aml/sass/pages/',
          src: ['*.scss', '!_'],
          dest: `dist/${distFolder}/${publicPath}/css/`,
          ext: '.css',
          extDot: 'last'
        }]
      },
      prod: {
        files: [{
          style: 'compressed',
          expand: true,
          cwd: 'WEB-INF/_ui-src/responsive/aml/sass/pages/',
          src: ['*.scss', '!_'],
          dest: `dist/${distFolder}/${publicPath}/css/`,
          ext: '.css',
          extDot: 'last'
        }]
      }
    },
    cssmin: {
      options: {
        compatibility: 'ie8', // 设置兼容模式
        noAdvanced: true // 取消高级特性
      },
      buildall: { // 按原文件结构压缩css文件夹内所有JS文件
        files: [{
          expand: true,
          cwd: `dist/${distFolder}/${publicPath}/css/`, // src目录下
          src: '**/*.css', // 所有css文件
          dest: `dist/${distFolder}/${publicPath}/css/`, // 输出到此目录下
          ext: '.css'
        }]
      }
    },
    eslint: {
      options: {
        configFile: 'eslint.json',
        outputFile: 'eslint.report.log',
        quiet: true,
        failOnError: false
      },
      target: [
        'WEB-INF/_ui-src/responsive/aml/js/modules/*.js',
        'WEB-INF/_ui-src/responsive/aml/js/utils/*.js',
        'WEB-INF/_ui-src/responsive/aml/js/pages/*.js',
      ]
    }
  });


  grunt.loadNpmTasks('grunt-webpack');
  grunt.loadNpmTasks('grunt-contrib-sass');
  grunt.loadNpmTasks('grunt-contrib-clean');
  grunt.loadNpmTasks('grunt-contrib-watch');
  grunt.loadNpmTasks('grunt-contrib-copy');
  grunt.loadNpmTasks('grunt-svgstore');
  grunt.loadNpmTasks('grunt-eslint');
  grunt.loadNpmTasks('grunt-contrib-cssmin');

  grunt.registerTask('dev', ['clean:build', 'eslint', 'sass:dev', `webpack:${distFolder}`, 'cssmin', 'copy:dev', `watch`]);

  grunt.registerTask('prod', ['clean:build', 'sass:prod', `webpack:${distFolder}`, 'cssmin', 'copy:prod']);
};