#!/bin/bash

git submodule update --init

for d in $HOME/dotfiles/*; do
    if [ -d "$d" ] && [ -e "$d/install.sh" ]; then
        $d/install.sh
    fi
done
