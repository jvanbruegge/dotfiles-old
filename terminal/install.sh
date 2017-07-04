#!/bin/bash

echo "Installing terminal config"

config="[/]
foreground-color='rgb(131,148,150)'
rewrap-on-resize=false
visible-name='ZSH'
palette=['rgb(46,52,54)', 'rgb(204,0,0)', 'rgb(78,154,6)', 'rgb(196,160,0)', 'rgb(52,101,164)', 'rgb(117,80,123)', 'rgb(6,152,154)', 'rgb(211,215,207)', 'rgb(85,87,83)', 'rgb(239,41,41)', 'rgb(138,226,52)', 'rgb(252,233,79)', 'rgb(114,159,207)', 'rgb(173,127,168)', 'rgb(52,226,226)', 'rgb(238,238,236)']
custom-command='zsh'
use-system-font=false
use-custom-command=true
use-theme-colors=false
font='Droid Sans Mono Dotted for Powerline 12'
background-color='rgb(0,43,54)'
audible-bell=true"

profile="1853ca92-6ce5-4cf7-8c80-37697e68d825"
path="/org/gnome/terminal/legacy/profiles:"

echo "$config" | dconf load "$path/:$profile/"

profiles=$(dconf read "$path/list")

echo "$profiles"

if [[ $profiles == "" ]]; then
    profiles="['$profile']"
elif [[ $profiles != *"'$profile'"* ]]; then
    profiles=${profiles%?}
    profiles="$profiles, '$profile']"
fi

dconf write "$path/list" "$profiles"
dconf write "$path/default" "'$profile'"
