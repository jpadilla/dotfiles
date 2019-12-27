#!/bin/bash

set -euf -o pipefail

echo "=> Installing VSCode Packages..."
xargs -n 1 code --force --install-extension < ~/.dotfiles/vscode/extensions.txt
