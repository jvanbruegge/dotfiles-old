#!/bin/bash

echo "Installing git config"

[ -e "$HOME/.gitconfig" ] && rm "$HOME/.gitconfig"

ln -s $HOME/dotfiles/git/.gitconfig $HOME/.gitconfig
