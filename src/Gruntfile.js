module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        browserify: {
            dist: {
                files: {
                    '../build/js/app.js': [
                        'bower_components/jquery/jquery.min.js',
                        'bower_components/bootstrap/dist/js/bootstrap.min.js',
                        'js/app.js'
                    ]
                },
                beforeHook: function(bundle) {
                    shim(bundle, {
                        jquery: {
                            path: 'bower_components/jquery/jquery.min.js',
                            exports: '$'
                        },
                        bootstrap: {
                            path: 'bower_components/bootstrap/dist/js/bootstrap.min.js',
                            exports: null,
                            depends: {
                                jquery: '$'
                            }
                        }

                    });

                }
            }
        },

        uglify: {
            build: {
                files: {
                    '../share/public/javascripts/app.min.js': ['../build/js/app.js']
                }
            }
        },
        stylus: {
            compile: {
                urlfunc: 'embedurl',
                options: {
                    compress: true
                },
                files: {
                    '../build/css/style.css': 'css/style.styl'
                }
            }
        },
      concat: {
          css: {
              src: ['bower_components/bootswatch/spacelab/bootstrap.min.css',
                  '../build/css/style.css'
              ],
              dest: '../build/css/combined.css'
          }
      },
      cssmin: {
          css: {
              src: '../build/css/combined.css',
              dest: '../share/public/stylesheets/bundle.css'
          }
      }

    });

    // Default task(s).
    grunt.loadNpmTasks('grunt-browserify');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-concat');
    grunt.loadNpmTasks('grunt-contrib-cssmin');
    grunt.loadNpmTasks('grunt-contrib-stylus');
    grunt.registerTask('default', ['browserify',
        'stylus',
        'concat',
        'cssmin',
        'uglify'
    ]);

};
