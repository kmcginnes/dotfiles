brew cask install sublime-text3
brew cask update sublime-text3

ZSH=$HOME/.dotfiles
SUBLIME_FOLDER="$HOME/Library/Application Support/Sublime Text 3/"

# Check that settings do not already exist
if [ ! -e "$SUBLIME_FOLDER/Installed Packages" ]; then
    mkdir -p "$SUBLIME_FOLDER/Installed Packages"
    ln -s ~/.dotfiles/sublime-text/Installed\ Packages/ ~/Library/Application\ Support/Sublime\ Text\ 3/Installed\ Packages/
fi

if [ ! -e "$SUBLIME_FOLDER/Packages/User" ]; then
    mkdir -p "$SUBLIME_FOLDER/Packages/User"
    ln -s ~/.dotfiles/sublime-text/User/ ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User
fi
