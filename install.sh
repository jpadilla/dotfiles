#!/bin/bash
echo "==> Running install.sh"

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing all of Homebrew..."
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

echo "Installing yarn..."
brew install yarn --without-node

# Install Python
echo "Installing Python..."
pyenv install 3.6.6
pyenv global 3.6.6

# VSCode packages
echo "Installing VSCode Packages..."
xargs -n 1 code --install-extension < ~/Projects/Personal/dotfiles/vscode/extensions.txt

echo
echo "==> Done!"
