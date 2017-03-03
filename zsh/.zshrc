#####################################################################
# General
#####################################################################

export CONFIG_DIR=$HOME/dotfiles/zsh

[ -e "${CONFIG_DIR}/.env" ] && source "${CONFIG_DIR}/.env"

#####################################################################
# oh-my-zsh config
#####################################################################

export ZSH=$CONFIG_DIR/oh-my-zsh
export ZSH_CUSTOM=$CONFIG_DIR/omz-custom

ZSH_THEME="powerlevel9k/powerlevel9k"
#ZSH_THEME="agnoster"
#ZSH_THEME="amuse"

#####################################################################
# Plugin config
#####################################################################

# Disable oh-my-zsh autoupdate
DISABLE_AUTO_UPDATE="true"

# Use case-sensitive completion
CASE_SENSITIVE="true"

# Display red dots when waiting for completion
COMPLETION_WAITING_DOTS="true"

# Don't overwrite the title
DISABLE_AUTO_TITLE="true"

# Show command execution time after given number of seconds.
REPORTTIME=30

#####################################################################
# Plugins
#####################################################################

plugins=(
    colored-man-pages
    extract
    history-substring-search
    z
    zsh-256color
    zsh-syntax-highlighting
)

source $ZSH/oh-my-zsh.sh

#####################################################################
# ZSH config
#####################################################################

# No terminal bell
setopt nobeep

# change dir without cd
setopt autocd

# Make cd behave like pushd
setopt autopushd

# Ignore duplicate paths on pushd
setopt pushdignoredups

# Ignore back to back duplicates in history search
setopt hist_find_no_dups

#####################################################################
# Aliases
#####################################################################

[ -e $CONFIG_DIR/.aliases ] && source "$CONFIG_DIR/.aliases"

#####################################################################
# Keybindings
#####################################################################

# Only use the local history for the arrow keys
up-line-or-local-history() {
	zle set-local-history 1
	zle history-substring-search-up
	zle set-local-history 0
}
zle -N up-line-or-local-history
down-line-or-local-history() {
	zle set-local-history 1
	zle history-substring-search-down
	zle set-local-history 0
}
zle -N down-line-or-local-history

# Search local history on Arrow Up/Down
bindkey "${terminfo[kcuu1]}" up-line-or-local-history
bindkey "${terminfo[kcud1]}" down-line-or-local-history
bindkey '^[[A' up-line-or-local-history
bindkey '^[[B' down-line-or-local-history

# Search global history on PgUp/PgDown and vicmd k/j
bindkey -M vicmd 'k' history-substring-search-up
bindkey -M vicmd 'j' history-substring-search-down
bindkey '^[[5~' history-substring-search-up
bindkey '^[[6~' history-substring-search-down

# Allow pattern search with Ctrl-r
bindkey "^r" history-incremental-pattern-search-backward

# Last argument of previous command with ESC.
bindkey -M viins '\e.' insert-last-word
