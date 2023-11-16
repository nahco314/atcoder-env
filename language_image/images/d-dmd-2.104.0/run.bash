#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
export DFLAGS="-O -release -boundscheck=off"
dub build --skip-registry=all --nodeps

elif [[ $action == "check" ]]; then
  if [[ ! -e judge ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  ./judge
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
