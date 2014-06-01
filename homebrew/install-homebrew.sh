#!/bin/sh
#
# Homebrew
#
# This installs some of the common dependencies needed (or at least desired)
# using Homebrew.

# Check for Homebrew
if test ! $(which brew)
then
  echo "  Installing Homebrew for you."
  ruby -e "$(curl -fsSL https://raw.github.com/Homebrew/homebrew/go/install)"
fi

# Install homebrew packages
# brew install grc coreutils spark

# Install cask
brew tap caskroom/cask
brew tap caskroom/versions
brew install brew-cask

exit 0
