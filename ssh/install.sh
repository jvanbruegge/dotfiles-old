#!/bin/bash

echo "Installing ssh config"

if [ -e "./config" ]; then
    [ ! -d "$HOME/.ssh" ] && mkdir "$HOME/.ssh"
    [ -e "$HOME/.ssh/config" ] && rm "$HOME/.ssh/config"

    ln -s "$HOME/dotfiles/ssh/config" "$HOME/.ssh/config"
fi
