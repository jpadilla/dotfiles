#!/bin/bash
echo "==> Running install.sh"

echo "Installing Homebrew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

echo "Installing all of Homebrew..."
brew tap Homebrew/bundle
brew bundle

# Install nvm
echo "Installing nvm..."
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | PROFILE=~/.extras bash
source ~/.bash_profile

# Install latest release of node
echo "Installing node..."
nvm install lts/*  --latest-npm

echo "Installing yarn..."
brew install yarn --without-node

# Install Python
echo "Installing Python..."
pyenv install 3.6.3
pyenv global 3.6.3

# Install Ruby
echo "Installing Ruby..."
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby -- --ignore-dotfiles

# VSCode packages
echo "Installing VSCode Packages..."
vscode-extensions-update

echo
echo "==> Done!"
