#!/bin/bash
#
# Author:   Mac Deluca
# Date:     20-08-23
# Purpose:  Helper script for launching projects
#
# Constants
PROJECTS_DIR="$HOME/projects/"
PROJECTS=(${PROJECTS_DIR}*)
NVIM_DIR="~/.config/nvim"
TMUX_DIR="~/.tmux.conf"
ERR_OUT_OF_BOUNDS='ERR: index out of bounds'
DIVIDER='--------------------'

# List projects
getProjects() {
  PROJECTS+=($NVIM_DIR)
  PROJECTS+=($TMUX_DIR)
  echo 'Common Directories:'
  echo '-v launch vim'
  echo $DIVIDER

  i=0
  for p in "${PROJECTS[@]}"; do
    echo "[${i}] ${p##*/}"
    i=$(expr $i + 1)
  done

  echo $DIVIDER
  read -p 'project index: ' projectIndex

  if ((projectIndex > i - 1 || projectIndex < 0)); then
    echo $ERR_OUT_OF_BOUNDS
  fi

  project=${PROJECTS[projectIndex]}
  (cd ${project} && vim .)
}

main() {
  getProjects
}

main


