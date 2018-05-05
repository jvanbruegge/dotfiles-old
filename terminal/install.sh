#!/bin/bash

echo "Installing terminal config"

config="[/]
foreground-color='rgb(131,148,150)'
rewrap-on-resize=false
visible-name='ZSH'
palette=['rgb(7,54,66)', 'rgb(220,50,47)', 'rgb(133,153,0)', 'rgb(181,137,0)', 'rgb(38,139,210)', 'rgb(211,54,130)', 'rgb(42,161,152)', 'rgb(238,232,213)', 'rgb(0,43,54)', 'rgb(203,75,22)', 'rgb(88,110,117)', 'rgb(101,123,131)', 'rgb(131,148,150)', 'rgb(108,113,196)', 'rgb(147,161,161)', 'rgb(253,246,227)']
bold-is-bright=false
use-system-font=false
use-theme-colors=false
font='Droid Sans Mono Dotted for Powerline 12'
background-color='rgb(0,43,54)'
audible-bell=false"

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
