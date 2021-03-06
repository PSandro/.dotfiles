#!/usr/bin/env bash
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" >/dev/null 2>&1 && pwd )"
prompt_install() {
    read -p "$1 is not installed. Install it? (y/n)" -n 1 -r
    if [[ $REPLY =~ ^[Yy]$ ]]; then
        if [ -x "$(command -v apt-get)" ]; then
            sudo apt-get install $1 -y

        elif [ -x "$(command -v pacman)" ]; then
            sudo pacman -S $1

        elif [ -x "$(command -v yum)" ]; then
            sudo yum install $1

       else
            echo "I'm not sure what your package manager is! Please install $1 manually and run this deploy script again."
        fi
    fi
}

check_for_software() {
    COMMAND=$1
    [[ -z "$2" ]] && PACKAGE=$1 || PACKAGE=$2

    if ! [ -x "$(command -v $COMMAND)" ]; then
        prompt_install $PACKAGE
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
            chsh -s $(which zsh)
        fi
    fi
}

# check/install zsh plugins
bash $DIR/zsh/plugins.sh

# install software
check_for_software zsh
check_for_software nvim neovim
check_for_software tmux

check_default_shell
# .zshrc
printf "source '$DIR/zsh/zshrcd.zsh'" > ~/.zshrc

# .gitconfig
git config --global include.path $DIR/git/gitconfig

# neovim config
mkdir -p ~/.config/nvim
printf "source $DIR/nvim/init.vim" > ~/.config/nvim/init.vim

echo "Please log out and log back in for default shell to be initialized."
