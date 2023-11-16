#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
cd submission
source ~/.ghcup/env
cabal v2-build --offline && cp $(cabal list-bin main) ../

elif [[ $action == "check" ]]; then
  if [[ ! -e main ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  ./main
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
