#!/bin/bash
echo "==> Running osx.sh"

# Keyboard
defaults write -g InitialKeyRepeat -int 15
defaults write -g KeyRepeat -int 2

# Disable automatic capitalization
defaults write NSGlobalDomain NSAutomaticCapitalizationEnabled -bool false

# Disable smart dashes
defaults write NSGlobalDomain NSAutomaticDashSubstitutionEnabled -bool false

# Disable automatic period substitution
defaults write NSGlobalDomain NSAutomaticPeriodSubstitutionEnabled -bool false

# Disable smart quotes
defaults write NSGlobalDomain NSAutomaticQuoteSubstitutionEnabled -bool false

# Disable auto-correct
defaults write NSGlobalDomain NSAutomaticSpellingCorrectionEnabled -bool false

# Disable Touch Bar typing suggestions
defaults write NSGlobalDomain NSAutomaticTextCompletionEnabled -bool false

# Touch Bar shows expanded control strip
defaults write com.apple.touchbar.agent PresentationModeGlobal fullControlStrip
