brew cask install sublime-text3
brew cask update sublime-text3

ZSH=$HOME/.dotfiles
SUBLIME_FOLDER="$HOME/Library/Application Support/Sublime Text 3"

# Check that settings do not already exist
if [ ! -e "$SUBLIME_FOLDER" ]; then
    mkdir -p "$SUBLIME_FOLDER"

	ln -s "$ZSH/sublime-text/Installed Packages/" "$SUBLIME_FOLDER/Installed Packages/"
	ln -s "$ZSH/sublime-text/Packages/" "$SUBLIME_FOLDER/Packages/"
fi
