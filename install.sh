#!/bin/bash
echo "==> Running install.sh"

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing dependencies from Brewfile..."
brew tap Homebrew/bundle
brew bundle

# Accept Xcode license
sudo xcodebuild -license accept

# Install nvm
echo "Installing nvm..."
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | PROFILE=~/.extras bash
source ~/.profile

# Install latest release of node
echo "Installing node..."
nvm install lts/*  --latest-npm

# VSCode packages
echo "Installing VSCode Packages..."
xargs -n 1 code --install-extension < ~/Projects/personal/dotfiles/vscode/extensions.txt

echo
echo "==> Done!"
