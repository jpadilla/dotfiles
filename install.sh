#!/bin/bash

set -euf -o pipefail

DOTFILES=$(pwd -P)

# Install homebrew
$DOTFILES/homebrew/install.sh

# find the installers and run them iteratively
installers=$(find . -type f -name install.sh -not -path "./install.sh" -not -path "./homebrew/install.sh")
echo "$installers" | while read installer; do
  bash -c "${installer}";
  echo
done

echo "==> Done!"
