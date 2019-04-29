#!/bin/bash

yay -S rustup nvim python3-pip
pip3 install neovim

# Rust compiler + Language server
rustup toolchain install stable
rustup default stable

rustup component add rls
rustup component add rust-analysis
rustup component add rust-src

# Typescript compiler + Language server
yay -S npm nodejs
sudo npm i -g typescript-language-server

# C compiler + Language server
yay -S clang clang-tools-extra

# Haskell toolchain + Language server
yay -S stack
git clone https://github.com/haskell/haskell-ide-engine
cd haskell-ide-engine
stack install
cd ..
rm -rf haskell-ide-engine

# Java language server
yay -S jdtls

# C# compiler and language server
yay -S omnisharp-roslyn
