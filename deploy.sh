#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
prompt_install() {
  echo "$1 is not installed. Installing..."
  if [ -x "$(command -v apt-get)" ]; then
    sudo apt-get install "$1" -y

  elif [ -x "$(command -v pacman)" ]; then
    sudo pacman -S "$1"

  elif [ -x "$(command -v dnf)" ]; then
    sudo dnf install "$1"

  else
    echo "I'm not sure what your package manager is! Please install $1 manually and run this deploy script again."
  fi
}

check_for_software() {
  COMMAND=$1
  [[ -z "$2" ]] && PACKAGE=$1 || PACKAGE=$2

  if ! [ -x "$(command -v "$COMMAND")" ]; then
    prompt_install "$PACKAGE"
  else
    echo "$COMMAND (package: $PACKAGE) is installed."
  fi
}

check_default_shell() {
  if [ -z "${SHELL##*zsh*}" ]; then
    echo "Default shell is zsh ($SHELL)."
  else
    read -p "Default shell is not zsh. Do you want to chsh -s \$(which zsh)? (y/n)" -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
      chsh -s "$(which zsh)"
    fi
  fi
}

ensure_line_in_file() {
  FILENAME=$1
  LINE=$2
  if ! grep -Fxq "$LINE" "$FILENAME";then
    printf '%s' "$LINE" >> "$FILENAME"
  fi
}

# install software
check_for_software zsh
check_for_software nvim neovim
check_for_software tmux
check_for_software exa
check_for_software bat

check_default_shell
# .zshrc
ensure_line_in_file ~/.zshrc "source '$DIR/zsh/zshrc.zsh'"

# .gitconfig
git config --global include.path "$DIR"/git/gitconfig

# neovim config
mkdir -p ~/.config/nvim
ensure_line_in_file ~/.config/nvim/init.vim "source $DIR/nvim/init.vim"

# sway config
mkdir -p ~/.config/sway
ensure_line_in_file ~/.config/sway/config "include $DIR/sway/config"

echo "Please log out and log back in for default shell to be initialized."
