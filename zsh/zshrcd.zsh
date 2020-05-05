export DOTFILES_HOME="$(pwd)/.dotfiles" #TODO: make dynamic dir name accessable

function dotfiles-update() {
  echo "Checking for updates."
  ({cd $DOTFILES_HOME && git fetch -q} &> /dev/null)

  if [ $({cd ~/.dotfiles} &> /dev/null && git rev-list HEAD...origin/master | wc -l) = 0 ]
  then
  	echo "Already up to date."
  else
  	echo "Updates Detected:"
  	({cd $DOTFILES_HOME} &> /dev/null && git log ..@{u} --pretty=format:%Cred%aN:%Creset\ %s\ %Cgreen%cd)
  	echo "Setting up..."
  	({cd $DOTFILES_HOME} &> /dev/null && git pull -q && git submodule update --init --recursive)
  fi
}

source $DOTFILES_HOME/zsh/zshrc.zsh
