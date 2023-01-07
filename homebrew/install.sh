#!/bin/bash

set -euf -o pipefail

if test ! $(which brew); then
  echo "=> Installing Homebrew..."
  bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  eval "$(/opt/homebrew/bin/brew shellenv)"
else
  echo "=> Updating Homebrew..."
  brew update
fi

echo "=> Installing dependencies from Brewfile..."
brew tap Homebrew/bundle
brew bundle --file="$HOME/.dotfiles/homebrew/Brewfile"
