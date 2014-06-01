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
  sudo git clone https://github.com/Homebrew/homebrew.git /usr/local > /tmp/homebrew-install.log
fi

# Install homebrew packages
# brew install grc coreutils spark

exit 0
