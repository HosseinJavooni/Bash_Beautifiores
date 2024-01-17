#!/bin/bash
#============MY_BASH_THEME_V2=============
parse_git_branch_unstage() {
  result=$(git status 2> /dev/null)
  if [[ $? = 0 && ($result == *"Untracked files:"* || $result == *"Changes not staged for commit:"*) ]]; then
     echo " $(echo -e '\uE0A0') $(git branch --show-current) "
  else
     echo ""
  fi
}
parse_git_branch_staged() {
  result=$(git status 2> /dev/null)
  if [[ $? = 0 && $result != *"Untracked files:"* && $result != *"Changes not staged for commit:"* && $result == *"Changes to be committed:"* ]]; then
     echo " $(echo -e '\uE0A0') $(git branch --show-current) "
  else
     echo ""
  fi
}
parse_git_branch_committed() {
  result=$(git status 2> /dev/null)
  if [[ $? = 0 && $result == *"nothing to commit, working tree clean"* ]]; then
     echo " $(echo -e '\uE0A0') $(git branch --show-current) "
  else
     echo ""
  fi
}

PS1="\[\033[01;32m\]${USER}@${HOSTNAME}\[\033[00m\]:\[\033[01;34m\]\w\n\[\033[31m\]\$(parse_git_branch_unstage)\[\033[33m\]\$(parse_git_branch_staged)\[\033[32m\]\$(parse_git_branch_committed)\[\033[33m\]$(echo -e '\u25B6')\[\033[00m\] "
