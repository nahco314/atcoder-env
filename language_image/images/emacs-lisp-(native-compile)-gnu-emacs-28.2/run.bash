#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
emacs --batch -f package-initialize --eval '(native-compile "Main.el" (expand-file-name "Main.eln"))' 

elif [[ $action == "check" ]]; then
  if [[ ! -e Main.eln ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  emacs --batch -f package-initialize -l Main.eln
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
