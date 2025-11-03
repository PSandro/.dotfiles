HISTFILE=~/.zsh_history
HISTSIZE=50000
SAVEHIST=50000
DOTFILES_HOME="$HOME/.dotfiles"

setopt EXTENDED_HISTORY
setopt HIST_EXPIRE_DUPS_FIRST
setopt HIST_IGNORE_DUPS
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_IGNORE_SPACE
setopt HIST_FIND_NO_DUPS
setopt HIST_SAVE_NO_DUPS
setopt HIST_REDUCE_BLANKS
setopt INC_APPEND_HISTORY
setopt SHARE_HISTORY
setopt AUTO_CD
setopt AUTO_PUSHD
setopt PUSHD_IGNORE_DUPS
setopt CORRECT
setopt GLOB_DOTS

alias ls="ls --color=auto"
alias ll="ls -lAh --color=auto"
alias la="ls -A --color=auto"
alias l="ls -CF --color=auto"
alias grep="grep --color=auto"
alias diff="diff --color=auto"
alias ip="ip -c"
alias vim="nvim"
alias ..="cd .."
alias ...="cd ../.."
alias ....="cd ../../.."
alias md="mkdir -p"
alias rd="rmdir"

bindkey -v
bindkey '^R' history-incremental-search-backward
export KEYTIMEOUT=1
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

PROMPT="%B%F{$RED}[%f%F{$YELLOW}%n%f%F{$GREEN}@%f%F{$BLUE}%m%f %F{$PURPLE}%2~%f%F{$RED}]%f%b$ "
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

zinit snippet OMZP::ssh-agent

zinit ice lucid wait
zinit light junegunn/fzf

### End of Zinit's installer chunk
# matches case insensitive for lowercase
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

# pasting with tabs doesn't perform completion
zstyle ':completion:*' insert-tab pending

zmodload zsh/complist

zinit wait lucid light-mode for \
  atinit"zicompinit; zicdreplay" \
      zdharma-continuum/fast-syntax-highlighting \
  atload"_zsh_autosuggest_start" \
      zsh-users/zsh-autosuggestions



export PATH=$PATH:$HOME/.local/bin
