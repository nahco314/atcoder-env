#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
sh -c "echo 'load main.u'; sleep 5 ; echo 'add'" | /opt/ucm/ucm > compile-out
echo 'compile main main' | /opt/ucm/ucm
if [ ! -f main.uc ]; then
  cat compile-out | ansifilter 1>&2
fi

elif [[ $action == "check" ]]; then
  if [[ ! -e main.uc ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  /opt/ucm/ucm run.compiled main.uc
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
