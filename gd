#!/bin/bash
#
# Author:   Mac Deluca
# Date:     20-08-23
# Purpose:  Helper script for launching common directories
#
projects=(${HOME}/projects/*)
directories=`echo "${projects[@]}" | tr ' ' '\n'`
selected=`printf "$directories" | fzf`
if [[ ! -z $selected ]]; then
  cd $selected
  (ls)
fi

