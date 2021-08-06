#!/bin/bash

set -euf -o pipefail

echo "=> Installing volta and node..."
curl -s https://get.volta.sh | bash -s -- --skip-setup

. $DOTFILES/node/setup-volta.zsh

volta install node
