# Vars
HISTFILE=~/.zsh_history
SAVEHIST=1000
setopt inc_append_history # To save every command before it is executed
setopt share_history # setopt inc_append_history

autoload -U compinit

compinit

source $DOTFILES_HOME/zsh/aliases.zsh
source $DOTFILES_HOME/zsh/window.zsh
source $DOTFILES_HOME/zsh/completion.zsh
source $DOTFILES_HOME/zsh/config.zsh
source $DOTFILES_HOME/zsh/prompt.zsh

# setup highlighting and fast-theme
source $DOTFILES_HOME/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
fast-theme clean &> /dev/null #TODO: check, if theme is already set

source $DOTFILES_HOME/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh
export PATH=$PATH:$DOTFILES_HOME/util
export PATH=$PATH:$HOME/.local/bin
