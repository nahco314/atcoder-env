#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
if cyber compile Main.cy > compile-out 2>&1; then
  touch ok
else
  cat compile-out 1>&2
fi

elif [[ $action == "check" ]]; then
  if [[ ! -e ok ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  cyber Main.cy
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
