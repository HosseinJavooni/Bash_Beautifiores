# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color|*-256color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
    ;;
*)
    ;;
esac

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    #alias dir='dir --color=auto'
    #alias vdir='vdir --color=auto'

    alias grep='grep --color=auto'
    alias fgrep='fgrep --color=auto'
    alias egrep='egrep --color=auto'
fi

# colored GCC warnings and errors
#export GCC_COLORS='error=01;31:warning=01;35:note=01;36:caret=01;32:locus=01:quote=01'

# some more ls aliases
alias ll='ls -alF'
alias la='ls -A'
alias l='ls -CF'

# Add an "alert" alias for long running commands.  Use like so:
#   sleep 10; alert
alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'

# Alias definitions.
# You may want to put all your additions into a separate file like
# ~/.bash_aliases, instead of adding them here directly.
# See /usr/share/doc/bash-doc/examples in the bash-doc package.

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi
#====================================================
#export JAVA_HOME=/opt/jdk1.8.0_361
export JAVA_HOME=/opt/jdk-17.0.7
export my_Linux_executable_file=/media/HDD2/Linux_Executable_files
export PATH=$my_Linux_executable_file:$JAVA_HOME/bin:$PATH
#============MY_BASH_THEME_V2=============
BOLD="\033[1m"
END="\[\033[0m\]"
BLACK_B="\033[48;2;0;0;0m"
BLACK_F="\033[38;2;0;0;0m"
B_D="\033[48;2;96;124;235m"
F_D="\033[38;2;96;124;235m"
B_H="\033[48;2;37;156;26m"
F_H="\033[38;2;37;156;26m"
B_U="\033[48;2;252;223;3m"
F_U="\033[38;2;252;223;3m"
F_GIT_1="\033[38;2;207;9;2m"
B_GIT_1="\033[48;2;207;9;2m"
F_GIT_2="\033[38;2;217;148;0m"
B_GIT_2="\033[48;2;217;148;0m"
F_GIT_3="\033[38;2;12;125;1m"
B_GIT_3="\033[48;2;12;125;1m"
YELLOW_ARROW="\033[38;2;252;252;3m"
#LEFT_ARROW="\uE0B2"
#LEFT_ARROW="\u25C0"
LEFT_ARROW=""
GIT_BRANCH_ICON="\uE0A0"
#RIGHT_ARROW="\uE0B0"
#RIGHT_ARROW="\u25B6"
RIGHT_ARROW=""
#---------------------------------
arrow_left_unstage() {
  result=$(git status 2> /dev/null)
  if [[ $? = 0 && ($result == *"Untracked files:"* || $result == *"Changes not staged for commit:"*) ]]; then
     echo "$(echo -e ${LEFT_ARROW})"
  else
     echo ""
  fi
}

parse_git_branch_unstage() {
  result=$(git status 2> /dev/null)
  if [[ $? = 0 && ($result == *"Untracked files:"* || $result == *"Changes not staged for commit:"*) ]]; then
     echo "GIT $(echo -e ${GIT_BRANCH_ICON}) $(git branch --show-current)"
  else
     echo ""
  fi
}
arrow_right_unstage() {
  result=$(git status 2> /dev/null)
  if [[ $? = 0 && ($result == *"Untracked files:"* || $result == *"Changes not staged for commit:"*) ]]; then
     echo "$(echo -e ${RIGHT_ARROW})"
  else
     echo ""
  fi
}
arrow_left_staged() {
  result=$(git status 2> /dev/null)
  if [[ $? = 0 && $result != *"Untracked files:"* && $result != *"Changes not staged for commit:"* && $result == *"Changes to be committed:"* ]]; then
     echo "$(echo -e ${LEFT_ARROW})"
  else
     echo ""
  fi
}
parse_git_branch_staged() {
  result=$(git status 2> /dev/null)
  if [[ $? = 0 && $result != *"Untracked files:"* && $result != *"Changes not staged for commit:"* && $result == *"Changes to be committed:"* ]]; then
     echo "GIT $(echo -e ${GIT_BRANCH_ICON}) $(git branch --show-current)"
  else
     echo ""
  fi
}
arrow_right_staged() {
  result=$(git status 2> /dev/null)
  if [[ $? = 0 && $result != *"Untracked files:"* && $result != *"Changes not staged for commit:"* && $result == *"Changes to be committed:"* ]]; then
     echo "$(echo -e ${RIGHT_ARROW})"
  else
     echo ""
  fi
}
arrow_left_committed() {
  result=$(git status 2> /dev/null)
  if [[ $? = 0 && $result == *"nothing to commit, working tree clean"* ]]; then
     echo "$(echo -e ${LEFT_ARROW})"
  else
     echo ""
  fi
}
parse_git_branch_committed() {
  result=$(git status 2> /dev/null)
  if [[ $? = 0 && $result == *"nothing to commit, working tree clean"* ]]; then
     echo "GIT $(echo -e ${GIT_BRANCH_ICON}) $(git branch --show-current)"
  else
     echo ""
  fi
}
arrow_right_committed() {
  result=$(git status 2> /dev/null)
  if [[ $? = 0 && $result == *"nothing to commit, working tree clean"* ]]; then
     echo "$(echo -e ${RIGHT_ARROW})"
  else
     echo ""
  fi
}
#---------------------------------
#---------------------------------
PS1="\[\033[93m\]╭─"
PS1+="$(echo -e ${LEFT_ARROW})"
PS1+="\[\033[103m\]"
PS1+="\[\033[30m\]$(echo -e '\xF0\x9F\x91\xA4'): \u "
PS1+="\[\033[42m\]"
PS1+="\[\033[93m\]"
PS1+="$(echo -e ${RIGHT_ARROW})"
PS1+="\[\033[30m\]"
PS1+="$(echo -e '\xF0\x9F\x92\xBB'): \h "
PS1+="\[\033[44m\]"
PS1+="\[\033[32m\]"
PS1+="$(echo -e ${RIGHT_ARROW})"
PS1+="\[\033[30m\]"
PS1+="🗁 : \w \[\033[0m\]"
#PS1+="${F_D}"
#PS1+="$(echo ${RIGHT_ARROW})"
#PS1+="${END}"
#PS1+="\n${F_U}${BOLD}╰❯${END}${F_GIT_1}$(echo -e ${RIGHT_ARROW})${END}"

PS1+="\n\[\033[93m\]╰❯"

PS1+="\[\033[31m\]\$(arrow_left_unstage)"
PS1+="\[\033[41m\]\[\033[30m\]\$(parse_git_branch_unstage)${END}"
PS1+="\[\033[31m\]\$(arrow_right_unstage)"

PS1+="\[\033[93m\]\$(arrow_left_staged)"
PS1+="\[\033[103m\]\[\033[30m\]\$(parse_git_branch_staged)${END}"
PS1+="\[\033[93m\]\$(arrow_right_staged)"

PS1+="\[\033[32m\]\$(arrow_left_committed)"
PS1+="\[\033[42m\]\[\033[30m\]\$(parse_git_branch_committed)${END}"
PS1+="\[\033[32m\]\$(arrow_right_committed)"

PS1+="\[\033[0m\]"
#echo -e ${PS1}


