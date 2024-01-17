#!/bin/bash
#============MY_BASH_THEME=============
parse_git_branch() {
  git branch --show-current > /dev/null 2>&1
  if [ $? -ne 0 ]; then
     echo ""
  else
     echo " $(echo -e '\uE0A0') $(git branch --show-current) "
  fi
}
PS1="\[\033[01;32m\]${USER}@${HOSTNAME}\[\033[00m\]:\[\033[01;34m\]\w\n\[\033[33m\]\$(parse_git_branch)\[\033[33m\]$(echo -e '\u25B6')\[\033[00m\] "
echo "${PS1}"
