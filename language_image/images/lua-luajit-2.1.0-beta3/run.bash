#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
luajit -O3 -b Main.lua luac.out

elif [[ $action == "check" ]]; then
  if [[ ! -e luac.out ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  luajit -O3 luac.out
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
