home = require 'home-dir'

module.exports = (grunt) ->
  grunt.initConfig
    symlink:
      options:
        overwrite: true
      folders:
        expand: true
        src: '**/*.symlink'
        dest: "#{ home() }/"
        flatten: true
        rename: (dest, src) ->
          finalDest = dest + '.' + src.replace('.symlink','')
          console.log "#{src} -> #{finalDest}"
          return finalDest

  grunt.loadTasks 'tasks'
