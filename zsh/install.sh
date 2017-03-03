#!/bin/bash

echo "Installing zsh config"

[ -e "$HOME/.zshrc" ] && rm "$HOME/.zshrc"
[ -d "$HOME/dotfiles/zsh/oh-my-zsh/themes/powerlevel9k" ] && rm -r "$HOME/dotfiles/zsh/oh-my-zsh/themes/powerlevel9k"

cp -r "$HOME/dotfiles/zsh/powerlevel9k" "$HOME/dotfiles/zsh/oh-my-zsh/themes/powerlevel9k/"
ln -s "$HOME/dotfiles/zsh/.zshrc" "$HOME/.zshrc"
