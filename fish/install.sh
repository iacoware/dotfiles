#!/bin/bash

# Install if we don't have it
if test ! $(which brew); then
    echo "Installing fish..."
    brew install fish
    echo /usr/local/bin/fish | sudo tee -a /etc/shells

    curl https://git.io/fisher --create-dirs -sLo ~/.config/fish/functions/fisher.fish
fi
