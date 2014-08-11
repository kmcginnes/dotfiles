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
      theme_terminal:
        command: 'open "osx/Smyck.terminal"'
      osx_defaults:
        command: 'source osx/settings.sh'
      sublime_package_control:
        command: 'mkdir -p "<%= config.sublime.path_app_support %>/Installed Packages" && curl -o "<%= config.sublime.path_app_support %>/Installed Packages/Package Control.sublime-package" https://sublime.wbond.net/Package%20Control.sublime-package'
      oh_my_zsh:
        command: 'git clone git://github.com/kmcginnes/oh-my-zsh.git ~/.oh-my-zsh'
    brew:
      git: 'git'
      git_extras: 'git-extras'
      rbenv: 'rbenv'
      ruby_build: 'ruby-build'
      # ffmpeg: 'ffmpeg'
      # dos2unix: 'dos2unix'
      cask: 'caskroom/cask/brew-cask'
    brew_tap:
      unofficial: 'caskroom/versions'
      fonts: 'caskroom/fonts'
    brew_cask_app:
      # alfred: 'alfred'
      sublime_text_3: 'sublime-text3'
      # chrome: 'google-chrome'
      # github: 'github'
      # hipchat: 'hipchat'
      # onepassword: 'onepassword'
      # evernote: 'evernote'
      # the_unarchiver: 'the-unarchiver'
      # vlc: 'vlc'
      # vmware_fusion: 'vmware-fusion'
      # dropbox: 'dropbox'
      # flux: 'flux'
      # gfxcardstatus: 'gfxcardstatus'
    brew_cask_font:
      # courier_new: 'font-courier-new'
      # inconsolata: 'font-inconsolata'
      # noto_sans: 'font-noto-sans'
      source_code_pro: 'font-source-code-pro'

  grunt.loadTasks 'tasks'
  grunt.loadNpmTasks 'grunt-shell'

  grunt.registerTask 'default', ['symlink','shell','brew','brew_tap','brew_cask_app','brew_cask_font']
