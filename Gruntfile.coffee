module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'
  grunt.loadNpmTasks 'grunt-contrib-uglify'
  grunt.loadNpmTasks 'grunt-contrib-cssmin'
  grunt.loadNpmTasks 'grunt-contrib-jasmine'

  grunt.initConfig(
    meta:
      js: 'js/**/*.js'
      css: 'css/**/*.css'
      coffee: 'src/coffee/**/*.coffee'
      sass: 'src/sass/**/*.sass'
      coffee_spec: 'spec/coffee/**/*_spec.coffee'
      js_spec: 'spec/js/**/spec.js'

    watch:
      css:
        files: '<%= meta.sass %>'
        tasks: ['compass:dev']
      coffee:
        files: ['<%= meta.coffee %>', '<%= meta.coffee_spec %>']
        tasks: ['coffee', 'jasmine:spec']

    coffee:
      compile:
        options:
          sourceMap: true
        files:
          'js/livemark.js': '<%= meta.coffee %>'
          'spec/js/spec.js': '<%= meta.coffee_spec %>'

    compass:
      dist:
        options:
          sassDir: 'src/sass'
          cssDir: 'css'
          environment: 'production'
      dev:
        options:
          sassDir: 'src/sass'
          cssDir: 'css'

    uglify:
      js:
        files:
          'js/livemark.min.js': 'js/livemark.js'

    cssmin:
      minimy:
        expand: true
        cwd: 'css/'
        src: ['*.css', '!*.min.css']
        dest: 'css/'
        ext: '.min.css'

    jasmine:
      spec:
        src: '<%= meta.js %>'
        options:
          specs: '<%= meta.js_spec %>'
          outfile: 'spec/jasmine.html'
          vendor: [
            'vendor/jquery.js'
            'vendor/jasmine-jquery.js'
            'vendor/showdown.js'
            'vendor/showdown/github.js'
            'vendor/showdown/table.js'
            'vendor/showdown/twitter.js'
          ]

  )

  grunt.registerTask 'default', ['watch']
  grunt.registerTask 'compile', ['compass:dev', 'coffee']
  grunt.registerTask 'spec', ['compile', 'jasmine']
  grunt.registerTask 'release', ['compile', 'uglify', 'cssmin']
