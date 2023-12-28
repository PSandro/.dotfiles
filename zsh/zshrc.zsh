# Vars
HISTFILE=~/.zsh_history
SAVEHIST=1000
DOTFILES_HOME="$HOME/.dotfiles"
setopt inc_append_history # To save every command before it is executed
setopt share_history # setopt inc_append_history

### WINDOW
function title() {
  # escape '%' chars in $1, make nonprintables visible
  a=${(V)1//\%/\%\%}
  # Truncate command, and join lines.
  a=$(print -Pn "%40>...>$a" | tr -d "\n")
  case $TERM in
  screen)
    print -Pn "\ek$a:$3\e\\" # screen title (in ^A")
    ;;
  xterm*|rxvt)
    print -Pn "\e]2;$2\a" # plain xterm title ($3 for pwd)
    ;;
  esac
}

### CONFIG
export LSCOLORS="exfxcxdxbxegedabagacad"
export CLICOLOR=true

# Colorize when possible
alias ls="exa"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ip="ip -c"
alias vim="nvim"
# alias cat="bat"

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

function man() {
	env \
		LESS_TERMCAP_md=$(tput bold; tput setaf 4) \
		LESS_TERMCAP_me=$(tput sgr0) \
		LESS_TERMCAP_mb=$(tput blink) \
		LESS_TERMCAP_us=$(tput setaf 2) \
		LESS_TERMCAP_ue=$(tput sgr0) \
		LESS_TERMCAP_so=$(tput smso) \
		LESS_TERMCAP_se=$(tput rmso) \
		PAGER="${commands[less]:-$PAGER}" \
		man "$@"
}

### PROMPT
autoload -U colors && colors

RED=166;
GREEN=72;
YELLOW=186;
BLUE=24;
PURPLE=168;

PROMPT="%B%F{$RED}[%f%F{$YELLOW}%n%f%F{$GREEN}@%f%F{$BLUE}%m%f %F{$PURPLE}%~%f%F{$RED}]%f%b$ "
RPROMPT="%F{$BLUE}%?%f"


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

### SSH-Agent
# if ! pgrep -u "$USER" ssh-agent > /dev/null; then
#     ssh-agent -t 1h > "$XDG_RUNTIME_DIR/ssh-agent.env"
# fi
# if [[ ! -f "$SSH_AUTH_SOCK" ]]; then
#     source "$XDG_RUNTIME_DIR/ssh-agent.env" >/dev/null
# fi
#
# The above is slow, use the plugin instead


zinit ice wait'!0' lucid
zinit light bobsoppe/zsh-ssh-agent

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit wait lucid light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust


### End of Zinit's installer chunk
# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

autoload -U compinit
zmodload zsh/complist
compinit

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions



export PATH=$PATH:$DOTFILES_HOME/util
export PATH=$PATH:$HOME/.local/bin

