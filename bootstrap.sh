#!/bin/bash
echo "==> Running bootstrap.sh"

echo "Updating OSX...."
sudo softwareupdate --install --all --verbose

echo "Installing Xcode command line tools..."
sudo xcode-select --install

echo "Cloning repo.."
mkdir -p ~/Projects/Personal
cd ~/Projects/Personal
git clone https://github.com/jpadilla/dotfiles.git
cd dotfiles

# Symlinks
./symlinks.sh

# Installs
./install.sh
