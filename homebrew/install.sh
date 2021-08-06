#!/bin/bash

set -euf -o pipefail

if test ! $(which brew); then
  echo "=> Installing Homebrew..."
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
else
  echo "=> Updating Homebrew..."
  brew update
fi

echo "=> Installing dependencies from Brewfile..."
brew tap Homebrew/bundle
brew bundle --file=$DOTFILES/homebrew/Brewfile
