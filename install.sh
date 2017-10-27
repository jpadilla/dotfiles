#!/bin/bash

# Setup dotfiles
echo "Setting up dotfiles..."
./symlinks.sh

# Homebrew
echo "Installing Homebrew and Cask..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew doctor

# Install cask
brew install caskroom/cask/brew-cask

# Alternative cask versions
brew tap caskroom/versions

# Install fonts with cask
echo "Installing fonts..."
brew tap caskroom/fonts
brew cask install font-inconsolata
brew cask install font-source-code-pro

# Install apps with Cask
echo "Installing OS X Apps..."
brew cask install dropbox
brew cask install spotify
brew cask install transmission
brew cask install paparazzi
brew cask install viscosity
brew cask install gpgtools

brew cask install sublime-text3
brew cask install iterm2
brew cask install heroku-toolbelt
brew cask install virtualbox
brew cask install vagrant
brew cask install rowanj-gitx
brew cask install robomongo
brew cask install mou
brew cask install cyberduck
brew cask install postgres
brew cask install mongodb

# Install development tools with Homebrew
echo "Installing development tools..."
brew install readline
brew install bash-completion
brew install git
brew install pyenv
brew install pyenv-virtualenv

echo "Installing utils..."
brew install tree
brew install watchman
brew install jq

# Install nvm
echo "Installing nvm..."
curl https://raw.githubusercontent.com/creationix/nvm/master/install.sh | PROFILE=~/.extras bash
source ~/.bash_profile

# Install latest release of node
echo "Installing node..."
nvm install v5
nvm alias default v5

# Install Node.js global tools
echo "Installing global modules with npm..."
npm install -g npm
npm install -g bower
npm install -g ember-cli
npm install -g jshint
npm install -g phantomjs
npm install -g babel
npm install -g eslint
npm install -g babel-eslint
npm install -g eslint-plugin-babel
npm install -g eslint-config-blimp

# Install Python
echo "Installing Python..."
pyenv install 2.7.9
pyenv install 3.4.3
pyenv global 2.7.9
source ~/.bash_profile

pyenv local 2.7.9
pip install --upgrade pip
pip install flake8

pyenv local 3.4.3
pip install --upgrade pip
pip install flake8

# Install RVM
gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3
curl -sSL https://get.rvm.io | bash -s stable --ruby -- --ignore-dotfiles
