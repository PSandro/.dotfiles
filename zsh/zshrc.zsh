# Vars
	HISTFILE=~/.zsh_history
	SAVEHIST=1000
	setopt inc_append_history # To save every command before it is executed
	setopt share_history # setopt inc_append_history

	git config --global push.default current

# Settings

alias reload != '. ~/.zshrc'
#Functions

# Custom cd

# For vim mappings:

# Completions
# These are all the plugin options available: https://github.com/robbyrussell/oh-my-zsh/tree/291e96dcd034750fbe7473482508c08833b168e3/plugins
#
# Edit the array below, or relocate it to ~/.zshrc before anything is sourced
# For help create an issue at github.com/parth/dotfiles

autoload -U compinit

plugins=(
	docker
)

for plugin ($plugins); do
    fpath=(~/.dotfiles/zsh/plugins/$plugin $fpath)
done

compinit

#source ~/.dotfiles/zsh/plugins/oh-my-zsh/lib/history.zsh
#source ~/.dotfiles/zsh/plugins/oh-my-zsh/lib/key-bindings.zsh
#source ~/.dotfiles/zsh/plugins/oh-my-zsh/lib/completion.zsh
#source ~/.dotfiles/zsh/plugins/zsh-autosuggestions/zsh-autosuggestions.zsh

source ~/.dotfiles/zsh/aliases.zsh
source ~/.dotfiles/zsh/window.zsh
source ~/.dotfiles/zsh/completion.zsh
source ~/.dotfiles/zsh/config.zsh
source ~/.dotfiles/zsh/prompt.zsh

source ~/.dotfiles/zsh/plugins/fast-syntax-highlighting/fast-syntax-highlighting.plugin.zsh 2>/dev/null
export PATH=$PATH:$HOME/.dotfiles/util
