#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
Rscript Main.R < /dev/null &> /dev/null
Rscript -e "parse('Main.R')" && touch a.out

elif [[ $action == "check" ]]; then
  if [[ ! -e a.out ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  Rscript Main.R
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
