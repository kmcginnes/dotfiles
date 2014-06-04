#!/bin/sh
#
# Alfred installer

brew cask install alfred
brew cask update alfred

# Link brew cask apps to Alfred
brew cask alfred link
