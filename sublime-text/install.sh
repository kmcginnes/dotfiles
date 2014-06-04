#!/bin/sh

brew cask install sublime-text3
brew cask update sublime-text3

# symlink settings in
SUBLIME_FOLDER="$HOME/Library/Application Support/Sublime Text 3"

# Check that settings do not already exist
if [ ! -e "$SUBLIME_FOLDER" ]; then
    mkdir -p "$SUBLIME_FOLDER/Packages"

	ln -s "$ZSH/sublime-text/User" "$SUBLIME_FOLDER/Packages"

	curl -o "$SUBLIME_FOLDER/Installed Packages/Package Control.sublime-package" https://sublime.wbond.net/Package%20Control.sublime-package
fi