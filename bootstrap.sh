#!/bin/bash
echo "==> Running bootstrap.sh"

echo "Updating OSX..."
sudo softwareupdate --install --all --verbose

echo "Installing Xcode command line tools..."
sudo softwareupdate --install "Command Line Tools (macOS High Sierra version 10.13) for Xcode-9.2" --verbose

echo "Cloning dotfiles repo..."
mkdir -p ~/Projects/Personal
cd ~/Projects/Personal
git clone https://github.com/jpadilla/dotfiles.git
cd dotfiles

# Symlinks
./symlinks.sh

# Installs
./install.sh
