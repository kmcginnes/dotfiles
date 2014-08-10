home = require 'home-dir'

module.exports = (grunt) ->
  grunt.initConfig
    config:
      sublime:
        path_app_support: home 'Library/Application Support/Sublime Text 3'
    symlink:
      options:
        overwrite: true
      dotfiles:
        expand: true
        src: '**/*.symlink'
        dest: "#{ home() }/"
        flatten: true
        rename: (dest, src) ->
          finalDest = dest + '.' + src.replace('.symlink','')
          console.log "#{src} -> #{finalDest}"
          return finalDest
      sublime_user:
        src: 'sublime-text/User'
        dest: '<%= config.sublime.path_app_support %>/Packages'
    shell:
      osx_defaults:
        command: 'source osx/settings.sh'
      sublime_package_control:
        command: 'mkdir -p "<%= config.sublime.path_app_support %>/Installed Packages" && curl -o "<%= config.sublime.path_app_support %>/Installed Packages/Package Control.sublime-package" https://sublime.wbond.net/Package%20Control.sublime-package'
      oh_my_zsh:
        command: 'brew install git'
      brew_git:
        command: 'brew install git'
      brew_git_extras:
        command: 'brew install git-extras'
      brew_rbenv:
        command: 'brew install rbenv'
      brew_ruby_build:
        command: 'brew install ruby-build'
      brew_ffmpeg:
        command: 'brew install ffmpeg'
      brew_dos2unix:
        command: 'brew install dos2unix'
      brew_cask:
        command: 'brew install caskroom/cask/brew-cask'
      brew_tap_unofficial:
        command: 'brew tap caskroom/versions'
      brew_tap_fonts:
        command: 'brew tap caskroom/fonts'
      brew_cask_alfred:
        command: 'brew cask install --appdir=/Applications alfred'
      brew_cask_sublime_text_3:
        command: 'brew cask install --appdir=/Applications sublime-text3'
      brew_cask_chrome:
        command: 'brew cask install --appdir=/Applications google-chrome'
      brew_cask_github:
        command: 'brew cask install --appdir=/Applications github'
      brew_cask_hipchat:
        command: 'brew cask install --appdir=/Applications hipchat'
      brew_cask_1password:
        command: 'brew cask install --appdir=/Applications onepassword'
      brew_cask_evernote:
        command: 'brew cask install --appdir=/Applications evernote'
      brew_cask_the_unarchiver:
        command: 'brew cask install --appdir=/Applications the-unarchiver'
      brew_cask_vlc:
        command: 'brew cask install --appdir=/Applications vlc'
      brew_cask_vmware_fusion:
        command: 'brew cask install --appdir=/Applications vmware-fusion'
      brew_cask_dropbox:
        command: 'brew cask install --appdir=/Applications dropbox'
      brew_cask_flux:
        command: 'brew cask install --appdir=/Applications flux'
      brew_cask_gfxcardstatus:
        command: 'brew cask install --appdir=/Applications gfxcardstatus'
      brew_cask_font_courier_new:
        command: 'brew cask install font-courier-new'
      brew_cask_font_inconsolata:
        command: 'brew cask install font-inconsolata'
      brew_cask_font_noto_sans:
        command: 'brew cask install font-noto-sans'
      brew_cask_font_source_code_pro:
        command: 'brew cask install font-source-code-pro'
      theme_terminal:
        command: 'open "osx/Smyck.terminal"'

  grunt.loadTasks 'tasks'
  grunt.loadNpmTasks 'grunt-shell'

  grunt.registerTask 'default', ['symlink','shell']
