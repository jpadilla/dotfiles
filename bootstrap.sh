#!/bin/bash
echo "==> Running bootstrap.sh"

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

echo "Updating OSX..."
sudo softwareupdate --install --all --verbose

echo "Installing Xcode command line tools..."
touch /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress
CMD_LINE_TOOLS=$(softwareupdate -l | grep "\*.*Command Line" | tail -n 1 | awk -F"*" '{print $2}' | sed -e 's/^ *//' | tr -d '\n')
sudo softwareupdate -i "$CMD_LINE_TOOLS" --verbose
rm /tmp/.com.apple.dt.CommandLineTools.installondemand.in-progress

echo "Cloning dotfiles repo..."
mkdir -p ~/Projects/Personal
cd ~/Projects/Personal
git clone https://github.com/jpadilla/dotfiles.git
cd dotfiles

# Symlinks
./symlinks.sh

# Installs
./install.sh
