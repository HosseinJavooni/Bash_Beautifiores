#============MY_BASH_THEME_V4=============
#!/bin/bash
# Author: Hossein Jabani
# Creation date: 2024-01-13
# Last Modification: 2024-01-13
# Description: When you append this code to ~/.bashrc your bash prompt changes to new form.
# Usage: just append this code to ~/.bashrc and run "source ~/.bashrc" command.

BOLD="\033[1m"
RESET="\[\033[0m\]"
B_D="\[\033[44m\]"
F_D=""
DIRECTORY_ICON="🗁 "
B_H="\[\033[42m\]"
F_H="\[\033[32m\]"
HOST_ICON="\xF0\x9F\x92\xBB"
B_U="\[\033[103m\]"
F_U="\[\033[93m\]"
USER_ICON="\xF0\x9F\x91\xA4"
USER_FONT_COLOR="\[\033[30m\]"
HOST_FONT_COLOR="\[\033[30m\]"
DIRECTORY_FONT_COLOR="\[\033[97m\]"
GIT_UNSTAGE_FOREGROUND="\[\033[31m\]"
GIT_UNSTAGE_FONT_COLOR="\[\033[97m\]"
GIT_UNSTAGE_BACKGROUND="\[\033[41m\]"
GIT_STAGED_FOREGROUND="\[\033[93m\]"
GIT_STAGED_FONT_COLOR="\[\033[30m\]"
GIT_STAGED_BACKGROUND="\[\033[103m\]"
GIT_COMMITED_FOREGROUND="\[\033[32m\]"
GIT_COMMITED_FONT_COLOR="\[\033[97m\]"
GIT_COMMITED_BACKGROUND="\[\033[42m\]"
#LEFT_ARROW="\uE0B2"
LEFT_ARROW="\u25C0"
GIT_BRANCH_ICON="\uE0A0"
#RIGHT_ARROW="\uE0B0"
RIGHT_ARROW="\u25B6"
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
PS1="${F_U}╭─"
PS1+="$(echo -e ${LEFT_ARROW})"
PS1+="${B_U}"
PS1+="${USER_FONT_COLOR}$(echo -e ${USER_ICON}): \u "
PS1+="${B_H}"
PS1+="${F_U}"
PS1+="$(echo -e ${RIGHT_ARROW})"
PS1+="${HOST_FONT_COLOR}"
PS1+="$(echo -e ${HOST_ICON}): \h "
PS1+="${B_D}"
PS1+="${F_H}"
PS1+="$(echo -e ${RIGHT_ARROW})"
PS1+="${DIRECTORY_FONT_COLOR}"
PS1+="${DIRECTORY_ICON}: \w  ${RESET}"

PS1+="\n${F_U}╰❯"

PS1+="${GIT_UNSTAGE_FOREGROUND}\$(arrow_left_unstage)"
PS1+="${GIT_UNSTAGE_BACKGROUND}${GIT_UNSTAGE_FONT_COLOR}\$(parse_git_branch_unstage)${RESET}"
PS1+="${GIT_UNSTAGE_FOREGROUND}\$(arrow_right_unstage)"

PS1+="${GIT_STAGED_FOREGROUND}\$(arrow_left_staged)"
PS1+="${GIT_STAGED_BACKGROUND}${GIT_STAGED_FONT_COLOR}\$(parse_git_branch_staged)${RESET}"
PS1+="${GIT_STAGED_FOREGROUND}\$(arrow_right_staged)"

PS1+="${GIT_COMMITED_FOREGROUND}\$(arrow_left_committed)"
PS1+="${GIT_COMMITED_BACKGROUND}${GIT_COMMITED_FONT_COLOR}\$(parse_git_branch_committed)${RESET}"
PS1+="${GIT_COMMITED_FOREGROUND}\$(arrow_right_committed)"

PS1+="${RESET}"

