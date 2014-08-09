#
# * grunt-contrib-symlink
# * https://github.com/gruntjs/grunt-contrib-symlink
# *
# * Copyright (c) 2013 Grunt Team
# * Licensed under the MIT license.
# 
"use strict"
module.exports = (grunt) ->
  fs = require("fs")
  path = require("path")
  chalk = require("chalk")

  grunt.registerMultiTask "symlink", "Create symbolic links.", ->
    nowrite = grunt.option "no-write"
    linkCount = 0
    
    # default options
    options = @options(overwrite: false)
    
    # overwrite options from CLI
    options.overwrite = grunt.option("overwrite") or options.overwrite
    @files.forEach (f) ->
      srcpath = f.src[0]
      destpath = f.dest
      unless grunt.file.exists srcpath
        grunt.log.warn "Source file \"" + srcpath + "\" not found."
        return
      else if grunt.file.exists(destpath)
        unless options.overwrite
          grunt.log.warn "Destination " + destpath + " already exists."
          return
        grunt.file.delete destpath
      
      # grunt.file.delete(destpath);
      
      # Strip any trailing slashes.
      destpath = destpath.replace(/[\\\/]$/, "")
      
      # The destdir is the location in which the symlink will be created.
      destdir = path.join(destpath, "..")
      
      # If the dest path is relative, create a proper relative symlink path.
      srcpath = path.relative(destdir, srcpath) or "."  unless grunt.file.isPathAbsolute(srcpath)
      
      # Create any necessary interim directories.
      grunt.file.mkdir destdir
      
      # The symlink mode is determined automatically.
      mode = (if grunt.file.isDir(f.src[0]) then "dir" else "file")
      grunt.verbose.write ((if nowrite then "Not actually linking " else "Linking ")) + "(" + mode + ") " + destpath + " -> " + srcpath + "..."
      try
        fs.symlinkSync srcpath, destpath, mode  unless nowrite
        grunt.verbose.ok()
      catch e
        grunt.verbose.error()
        grunt.log.error e
        grunt.fail.warn "Failed to create symlink: " + "(" + mode + ") " + destpath + " -> " + srcpath + "."
      linkCount++
      return

    grunt.log.ok "Created " + linkCount + " symbolic links."
    return

  return
