#!/bin/bash

[ -e "$HOME/.local/share/nvim/site" ] && rm -rf "$HOME/.local/share/nvim/site"
mkdir -p "$HOME/.local/share/nvim/site"
[ -e "$HOME/.config/nvim" ] && rm -rf "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim"

ln -s "$HOME/dotfiles/neovim/init.vim" "$HOME/.config/nvim/init.vim"

nvim +PlugInstall +qall
