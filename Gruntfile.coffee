home = require 'home-dir'

module.exports = (grunt) ->
  grunt.initConfig
    symlink:
      options:
        overwrite: true
      folders:
        # expand: true
        # nonull: true
        # overwrite: true
        src: ['**/*.symlink']
        dest: "#{ home() }"
        # ext: ''
        # extdot: 'last'
        flatten: true
        rename: (dest, src) ->
          finalDest = dest + '.' + src.replace('.symlink','')
          console.log "#{src} -> #{finalDest}"
          return finalDest

  grunt.loadNpmTasks 'grunt-contrib-symlink'
