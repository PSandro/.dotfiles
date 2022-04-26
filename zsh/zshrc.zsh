# Vars
HISTFILE=~/.zsh_history
SAVEHIST=1000
DOTFILES_HOME="$HOME/.dotfiles"
setopt inc_append_history # To save every command before it is executed
setopt share_history # setopt inc_append_history

### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

autoload -U compinit

source $DOTFILES_HOME/zsh/window.zsh
source $DOTFILES_HOME/zsh/completion.zsh
source $DOTFILES_HOME/zsh/config.zsh
source $DOTFILES_HOME/zsh/prompt.zsh


export PATH=$PATH:$DOTFILES_HOME/util
export PATH=$PATH:$HOME/.local/bin

zinit for \
    light-mode  zsh-users/zsh-autosuggestions \
    light-mode  zdharma-continuum/fast-syntax-highlighting \
