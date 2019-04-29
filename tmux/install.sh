#!/bin/bash

ln -s $HOME/dotfiles/tmux/.tmux.conf $HOME/

mkdir -p "$XDG_CONFIG_HOME/tmuxinator/"

ln -s $HOME/dotfiles/tmux/projects/* $XDG_CONFIG_HOME/tmuxinator/
