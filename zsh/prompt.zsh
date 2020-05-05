# Reference for colors: http://stackoverflow.com/questions/689765/how-can-i-change-the-color-of-my-prompt-in-zsh-different-from-normal-text

autoload -U colors && colors

BLACK=59;
RED=166;
GREEN=72;
YELLOW=186;
BLUE=24;
PURPLE=168;
LIGHT_BLUE=38;
GREY=230;

set_prompt () {
  PS1="%B%{%F{$RED}%}[%{%F{$YELLOW}%}%n%{%F{$GREEN}%}@%{%F{$BLUE}%}%M %{%F{$PURPLE}%}%~%{%F{$RED}%}]%{$reset_color%}$%b "
}


git_branch() {
  echo $($git symbolic-ref HEAD 2>/dev/null | awk -F/ {'print $NF'})
}

precmd () {
  title "zsh" "%m" "%55<...<%~"
  set_prompt
}
