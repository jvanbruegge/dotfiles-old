#!/bin/bash

echo "Installing zsh config"

[ -e "$HOME/.zshrc" ] && rm "$HOME/.zshrc"

ln -s "$HOME/dotfiles/zsh/.zshrc" "$HOME/.zshrc"
