#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
perl -c Main.pl && touch ok

elif [[ $action == "check" ]]; then
  if [[ ! -e ok ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  perl Main.pl
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
