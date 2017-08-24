#/bin/bash

[ -e "$HOME/.config/nvim" ] && rm -rf "$HOME/.config/nvim"
mkdir -p "$HOME/.config/nvim"

ln -s "$HOME/dotfiles/neovim/init.vim" "$HOME/.config/nvim/init.vim"

nvim +PluginInstall +qall

dir=$(pwd)
cd "$HOME/.config/nvim/bundle/YouCompleteMe"
./install.py --clang-completer --system-libclang --racer-completer
cd "$dir"

ln -s "$HOME/dotfiles/neovim/syntax" "$HOME/.config/nvim/syntax"
ln -s "$HOME/dotfiles/neovim/filetype.vim" "$HOME/.config/nvim/filetype.vim"
ln -s "$HOME/dotfiles/neovim/.ycm_extra_conf.py" "$HOME/.config/nvim/.ycm_extra_conf.py"
