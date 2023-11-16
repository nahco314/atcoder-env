#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
export CARP_DIR=/opt/carp-v0.5.5-x86_64-linux
carp -b --optimize Main.carp 1>&2

elif [[ $action == "check" ]]; then
  if [[ ! -e ./out/Untitled ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  ./out/Untitled
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
