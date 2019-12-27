#!/bin/bash

set -euf -o pipefail

if test ! $(which brew); then
  echo "=> Installing Homebrew..."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
  echo "=> Updating Homebrew..."
  brew update
fi

echo "=> Installing dependencies from Brewfile..."
brew tap Homebrew/bundle
brew bundle --file=$DOTFILES/homebrew/Brewfile
