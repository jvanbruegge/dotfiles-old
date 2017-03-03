#/bin/bash

[ -e "$HOME/.config/nvim" ] && rm -rf "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim"

ln -s "$HOME/dotfiles/neovim/init.vim" "$HOME/.config/nvim/init.vim"

nvim +PluginInstall +qall

dir=$(pwd)
cd "$HOME/.config/nvim/bundle/YouCompleteMe"
./install.py --clang-completer --system-libclang
cd "$dir"
