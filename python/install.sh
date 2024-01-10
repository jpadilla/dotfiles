#!/bin/bash

set -euf -o pipefail

PYTHON_VERSION=3.12.1

if [[ ! -d "$HOME/.pyenv/versions/$PYTHON_VERSION" ]]; then
  echo "=> Installing Python $PYTHON_VERSION..."
  pyenv install "$PYTHON_VERSION"
  pyenv global "$PYTHON_VERSION"
fi
