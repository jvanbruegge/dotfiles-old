#!/bin/bash

pacaur -S rustup nvim python3-pip
pip3 install neovim

# Rust compiler + Language server
rustup toolchain install stable
rustup default stable

rustup component add rls-preview
rustup component add rust-analysis
rustup component add rust-src

# Typescript compiler + Language server
pacaur -S npm nodejs
sudo npm i -g typescript
git clone https://github.com/sourcegraph/javascript-typescript-langserver.git
cd javascript-typescript-langserver
npm install
npm run build
cd ..
sudo mv javascript-typescript-langserver /opt/
sudo chmod +x /opt/javascript-typescript-langserver/lib/language-server-stdio.js

# C compiler + Language server
pacaur -S clang clang-tools-extra

# Haskell toolchain + Language server
#git clone https://github.com/haskell/haskell-ide-engine
#cd haskell-ide-engine
#stack install

# Java language server
pacaur -S jdtls

# C# compiler and language server
pacaur -S omnisharp-roslyn
