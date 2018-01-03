#!/bin/bash
echo "==> Running osx.sh"

# Keyboard
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

# Disable automatic capitalization as it’s annoying when typing code
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false
