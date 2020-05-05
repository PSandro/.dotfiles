# Reference for colors: http://stackoverflow.com/questions/689765/how-can-i-change-the-color-of-my-prompt-in-zsh-different-from-normal-text

autoload -U colors && colors

BLACK=59;
RED=166;
GREEN=72;
YELLOW=186;
BLUE=24;
PURPLE=166;
LIGHT_BLUE=38;
GREY=230;

BLACK_BOLD=59;
RED_BOLD=209;
GREEN_BOLD=151;
YELLOW_BOLD=222;
BLUE_BOLD=74;
PURPLE_BOLD=209;
LIGHT_BLUE_BOLD=109;
GREY_BOLD=15;


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
