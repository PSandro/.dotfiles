#!/bin/bash
repos=(
"https://github.com/zsh-users/zsh-autosuggestions.git"
"https://github.com/zdharma/fast-syntax-highlighting.git"
)

function check {
	name=$(sed 's/https:\/\/.*\/.*\/\(.*\)\.git/\1/g' <<< $1)
	pluginDir="$HOME/.dotfiles/zsh/plugins/$name"

	echo "checking $pluginDir..."
	if [ -d "$pluginDir" ]; then
		cd "$pluginDir"
		git pull
	else
		mkdir -p "$pluginDir"
		cd "$pluginDir"
		git clone $1 "$pluginDir"
	fi
}

for i in ${!repos[*]}; do
	check ${repos[$i]}
done
