module.exports = function(grunt) {

    // Project configuration.
    grunt.initConfig({
        pkg: grunt.file.readJSON('package.json'),
        browserify: {
            js: {
                files: {
                    '../share/public/javascripts/app.js': ['js/app.js'],
                    '../share/public/javascripts/admin.js': ['js/admin.js']
                }
            }
        },
        uglify: {
            build: {
                files: {
                    '../share/public/javascripts/app-min.js': ['../public/javascripts/app.js'],
                    '../share/public/javascripts/admin-min.js': ['../public/javascripts/admin.js']
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
                    '../share/public/stylesheets/bundle.css': 'css/style.styl',
                    '../share/public/stylesheets/admin.css': 'css/admin.styl'
                }
            }
        }
    });

    // Default task(s).
    grunt.loadNpmTasks('grunt-browserify');
    grunt.loadNpmTasks('grunt-contrib-uglify');
    grunt.loadNpmTasks('grunt-contrib-stylus');
    grunt.registerTask('default', ['browserify',
        'stylus',
        'uglify'
    ]);

};
