#!/bin/bash

echo "Installing ssh config"

[ ! -d "$HOME/.ssh" ] && mkdir "$HOME/.ssh"
[ -e "$HOME/.ssh/config" ] && rm "$HOME/.ssh/config"

ln -s "$HOME/dotfiles/ssh/config" "$HOME/.ssh/config"
