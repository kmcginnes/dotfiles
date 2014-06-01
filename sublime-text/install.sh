brew cask install sublime-text3
brew cask update sublime-text3

mkdir -p ~/Library/Application\ Support/Sublime\ Text\ 3/
ln -s ~/.dotfiles/sublime-text/Installed\ Packages/ ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/
ln -s ~/.dotfiles/sublime-text/User/ ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User