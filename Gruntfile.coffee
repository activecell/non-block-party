mongoose = require 'mongoose'

MONGO_URI = process.env.MONGO_URI || 'mongodb://localhost/sand'

# This is the main application configuration file.  It is a Grunt
# configuration file, which you can learn more about here:
# https://github.com/cowboy/grunt/blob/master/docs/configuring.md
module.exports = (grunt) ->
  grunt.initConfig

    coffeeify:
      app:
        files: [
          src: ["src/app/application.coffee"]
          dest: 'public/js/app.js'
        ]

    # The concatenate task is used here to merge the almond require/define
    # shim and the templates into the application code.  Its named
    # dump/debug/require.js, because we want to only load one script file in
    # index.html.
    concat:
      vendor:
        src: [
          "vendor/jquery.js",
          "vendor/handlebars.js",
          "vendor/ember.js",
          "vendor/ember-data.js"
        ]
        dest: "public/js/vendor.js"
      css:
        src: [
          "vendor/bootstrap.css",
          "public/css/index.css"
        ]
        dest: "public/css/index.css"

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
          "public/js/app.min.js": ["public/js/vendor.js", "public/js/templates.js", "public/js/app.js"]


    ember_handlebars:
      compile:
        options:
          processName: (name) ->
            name
              .replace('src/app/views/', '')
              .replace('.hbs', '')
        files:
          "public/js/templates.js": ["src/app/views/**/*.hbs"]

    # The watch task can be used to monitor the filesystem and execute
    # specific tasks when files are modified.  By default, the watch task is
    # available to compile stylus templates if you are unable to use the
    # runtime builder (use if you have a custom server, PhoneGap, Adobe Air,
    # etc.)
    watch:
      app:
        files: ["src/app/**/*.coffee"]
        tasks: ["coffeeify"]

      hbs:
        files: ["src/app/views/**/*.hbs"]
        tasks: ["ember_handlebars"]

      vendor:
        files: ["vendor/**/*.js"]
        tasks: ["concat:vendor"]

      scss:
        files: ["styles/**/*.scss"]
        tasks: ["sass", "concat:css"]



  grunt.loadNpmTasks "grunt-contrib-concat"
  grunt.loadNpmTasks "grunt-contrib-coffee"
  grunt.loadNpmTasks "grunt-contrib-sass"
  grunt.loadNpmTasks "grunt-contrib-watch"
  grunt.loadNpmTasks "grunt-contrib-uglify"
  grunt.loadNpmTasks "grunt-ember-handlebars"
  grunt.loadNpmTasks "grunt-coffeeify"

  grunt.registerTask "compile", ["concat:vendor", "coffeeify", "sass", "ember_handlebars", "concat:css"]
  grunt.registerTask "production", ["compile", "uglify"]

  grunt.registerTask "drop", "drop the database", ->
    # async mode
    done = @async()

    mongoose.connect MONGO_URI, (err) ->
      throw err if err
      mongoose.connection.db.dropDatabase done


