#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
export PATH=/opt/rakudo-pkg/bin:$PATH
export RAKUDO_ERROR_COLOR=0
raku -c Main.p6 && touch ok

elif [[ $action == "check" ]]; then
  if [[ ! -e ok ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  raku Main.p6
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
