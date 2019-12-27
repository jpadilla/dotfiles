#!/bin/bash
echo "==> Running bootstrap.sh"

echo "Updating OSX..."
sudo softwareupdate --install --all --verbose

echo "Cloning dotfiles repo..."
git clone https://github.com/jpadilla/dotfiles.git ~/.dotfiles
cd ~/.dotfiles

# Set macos defaults
~/.dotfiles/macos/set-defaults.sh

# Symlinks
~/.dotfiles/symlinks.sh

# Installs
~/.dotfiles/install.sh
