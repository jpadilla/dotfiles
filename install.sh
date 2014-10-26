#!/bin/bash

# Setup dotfiles
echo "Setting up dotfiles..."
./bootstrap.sh --force
 
# Homebrew
echo "Installing Homebrew and Cask..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew install caskroom/cask/brew-cask
 
# Alternative cask versions
brew tap caskroom/versions
 
# Install apps with Cask
echo "Installing OS X Apps..."
brew cask install slack
brew cask install dropbox
brew cask install evernote
brew cask install harvest
brew cask install authy-bluetooth
brew cask install spotify
brew cask install transmission
brew cask install paparazzi
brew cask install viscosity
brew cask install mailbox
brew cask install gpgtools
 
brew cask install sublime-text3
brew cask install iterm2
brew cask install heroku-toolbelt
brew cask install virtualbox
brew cask install vagrant
brew cask install gitx-rowanj
brew cask install robomongo
brew cask install macdown
brew cask install cyberduck
brew cask install postgres
 
# Install development tools with Homebrew
echo "Installing development tools..."
brew install bash-completion
brew install git
brew install python
brew install python3
brew install go
 
# Install nvm
echo "Installing nvm..."
curl https://raw.githubusercontent.com/creationix/nvm/v0.17.2/install.sh | PROFILE=~/.extras bash
source ~/.bash_profile
 
# Install latest v0.10.x release of node
echo "Installing node..."
nvm install 0.10
nvm alias default stable
 
# Install Node.js global tools
npm install -g npm
npm install -g bower
npm install -g ember-cli
npm install -g grunt-cli
npm install -g gulp
npm install -g jshint
 
# Install Python tools
mkdir ~/.virtualenvs
pip install virtualenvwrapper
pip3 install virtualenvwrapper
pip3 install flake8
