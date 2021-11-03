export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# Colorize when possible
alias ls="exa"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ip="ip -c"
alias cat="bat"

# Set FSH THEME_NAME
#export FAST_THEME_NAME="clean"

# vi mode
bindkey -v
export KEYTIMEOUT=1

# Use vim keys in tab complete menu:
#bindkey -M menuselect 'j' vi-backward-char
#bindkey -M menuselect 'l' vi-up-line-or-history
#bindkey -M menuselect 'ö' vi-forward-char
#bindkey -M menuselect 'k' vi-down-line-or-history
#bindkey -v '^?' backward-delete-char

export EDITOR=/usr/bin/nvim
export VISUAL=/usr/bin/nvim

