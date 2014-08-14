module.exports = (grunt) ->
  fs = require "fs"
  path = require "path"
  chalk = require "chalk"
  require 'shelljs/global'

  grunt.registerMultiTask "brew", "Install utilities with Homebrew.", ->
    cmd = 'brew install ' + this.data
    grunt.verbose.writeln "Running: #{chalk.cyan cmd}"
    exec cmd

    grunt.log.ok "Installed " + this.data

  grunt.registerMultiTask "brew_tap", "Add additional taps to Homebrew.", ->
    cmd = 'brew tap ' + this.data
    grunt.verbose.writeln "Running: #{chalk.cyan cmd}"
    exec cmd

    grunt.log.ok "Installed " + this.data

  grunt.registerMultiTask "brew_cask_app", "Install apps with Homebrew Cask.", ->
    cmd = 'brew cask install --appdir=/Applications ' + this.data
    grunt.verbose.writeln "Running: #{chalk.cyan cmd}"
    exec cmd

  grunt.registerMultiTask "brew_cask_font", "Install fonts with Homebrew Cask.", ->
    cmd = 'brew cask install --appdir=/Applications ' + this.data
    grunt.verbose.writeln "Running: #{chalk.cyan cmd}"
    exec cmd

    grunt.log.ok "Installed " + this.data
