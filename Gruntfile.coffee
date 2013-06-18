# This is the main application configuration file.  It is a Grunt
# configuration file, which you can learn more about here:
# https://github.com/cowboy/grunt/blob/master/docs/configuring.md
module.exports = (grunt) ->
  grunt.initConfig

    coffee:
      app:
        src: ["src/app/**/*.coffee"]
        dest: "public/js/app.js"
        options:
          bare: true
          join: true

    # The concatenate task is used here to merge the almond require/define
    # shim and the templates into the application code.  Its named
    # dump/debug/require.js, because we want to only load one script file in
    # index.html.
    concat:
      vendor:
        src: [
          "vendor/jquery.js",
          "vendor/handlebars.js",
          "vendor/ember.js"
        ]
        dest: "public/js/vendor.js"

    # The stylus task is used to compile Stylus stylesheets into a single
    # CSS file for debug and release deployments.
    sass:
      compile:
        files:
          "public/css/index.css": [
            "styles/**/*.scss"
          ]

    uglify:
      app:
        files:
          "public/js/app.min.js": ["public/js/vendor.js", "public/js/app.js"]


    # The watch task can be used to monitor the filesystem and execute
    # specific tasks when files are modified.  By default, the watch task is
    # available to compile stylus templates if you are unable to use the
    # runtime builder (use if you have a custom server, PhoneGap, Adobe Air,
    # etc.)
    watch:
      compile:
        files: ["src/app/**/*.coffee"]
        tasks: ["coffee"]

      vendor:
        files: ["vendor/**/*.js"]
        tasks: ["concat:vendor"]

      stylus:
        files: ["styles/**/*.scss"]
        tasks: ["sass"]



  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-uglify"

  grunt.registerTask "compile", ["concat:vendor", "coffee", "sass"]
  grunt.registerTask "production", ["compile", "uglify"]
