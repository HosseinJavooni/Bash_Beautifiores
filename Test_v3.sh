BOLD="\033[1m"
END="\033[0m"
BLACK_B="\033[48;2;0;0;0m"
BLACK_F="\033[38;2;0;0;0m"
B_D="\033[48;2;96;124;235m"
F_D="\033[38;2;96;124;235m"
B_H="\033[48;2;37;156;26m"
F_H="\033[38;2;37;156;26m"
B_U="\033[48;2;252;223;3m"
F_U="\033[38;2;252;223;3m"
F_GIT_1="\e[38;2;207;9;2m"
B_GIT_1="\e[48;2;207;9;2m"
F_GIT_2="\e[38;2;217;148;0m"
B_GIT_2="\e[48;2;217;148;0m"
F_GIT_3="\e[38;2;12;125;1m"
B_GIT_3="\e[48;2;12;125;1m"
YELLOW_ARROW="\033[38;2;252;252;3m"
#---------------------------------
parse_git_branch_unstage() {
  result=$(git status 2> /dev/null)
  if [[ $? = 0 && ($result == *"Untracked files:"* || $result == *"Changes not staged for commit:"*) ]]; then
     echo "$(echo -e '\uE0A0') $(git branch --show-current)"
  else
     echo ""
  fi
}
parse_git_branch_staged() {
  result=$(git status 2> /dev/null)
  if [[ $? = 0 && $result != *"Untracked files:"* && $result != *"Changes not staged for commit:"* && $result == *"Changes to be committed:"* ]]; then
     echo "$(echo -e '\uE0A0') $(git branch --show-current)"
  else
     echo ""
  fi
}
parse_git_branch_committed() {
  result=$(git status 2> /dev/null)
  if [[ $? = 0 && $result == *"nothing to commit, working tree clean"* ]]; then
     echo "$(echo -e '\uE0A0') $(git branch --show-current)"
  else
     echo ""
  fi
}
#---------------------------------
PS1="${F_U}${BOLD}╭─${END}"
PS1+="${F_U}"
PS1+="$(echo '\uE0B2')"
PS1+="${END}"
PS1+="${BOLD}"
PS1+="${B_U}"
PS1+="${BLACK_F}$(echo '\xF0\x9F\x91\xA4')${USER}${END}"
PS1+="${END}"
PS1+="${B_H}"
PS1+="${F_U}"
PS1+="$(echo '\uE0B0')"
PS1+="${END}"
PS1+="${B_H}"
PS1+="${BOLD}"
PS1+="${BLACK_F} $(echo '\xF0\x9F\x92\xBB')${HOSTNAME}${END}"
PS1+="${END}"
PS1+="${B_D}"
PS1+="${F_H}"
PS1+="$(echo '\uE0B0')"
PS1+="${END}"
PS1+="${B_D}"
PS1+="${BOLD}"
PS1+="${BLACK_F} 📂${PWD} ${END}"
PS1+="${END}"
#PS1+="${F_D}"
#PS1+="$(echo '\uE0B0')"
#PS1+="${END}"
PS1+="\n${F_U}${BOLD}╰❯${END}"
PS1+="${F_GIT_1}$(echo '\uE0B2')${END}"
PS1+="${B_GIT_1}${BOLD}$(parse_git_branch_unstage)${END}"
PS1+="${F_GIT_1}$(echo '\uE0B0')${END}"

PS1+="${F_GIT_2}$(echo '\uE0B2')${END}"
PS1+="${B_GIT_2}${BOLD}$(parse_git_branch_staged)${END}"
PS1+="${F_GIT_2}$(echo '\uE0B0')${END}"

PS1+="${F_GIT_3}$(echo '\uE0B2')${END}"
PS1+="${B_GIT_3}${BOLD}$(parse_git_branch_committed)${END}"
PS1+="${F_GIT_3}$(echo '\uE0B0')${END}"
#echo -e ${PS1}
