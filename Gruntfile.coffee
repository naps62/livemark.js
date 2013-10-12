module.exports = (grunt) ->

  grunt.loadNpmTasks 'grunt-contrib-watch'
  grunt.loadNpmTasks 'grunt-contrib-compass'
  grunt.loadNpmTasks 'grunt-contrib-coffee'

  grunt.initConfig(
    watch:
      css:
        files: 'src/sass/**/*.sass',
        tasks: ['compass:dev']
      coffee:
        files: 'src/coffee/**/*.coffee',
        tasks: ['coffee']

    coffee:
      compile:
        options:
          sourceMap: true
        files:
          'js/livemark.js': 'src/coffee/**/*.coffee'

    compass:
      dist:
        options:
          sassDir: 'src/sass',
          cssDir: 'css',
          environment: 'production'
      dev:
        options:
          sassDir: 'src/sass',
          cssDir: 'css'
  )

  grunt.registerTask 'default', ['watch']
