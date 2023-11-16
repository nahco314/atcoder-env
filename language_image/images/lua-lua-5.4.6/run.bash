#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
export PATH=$PATH:/judge/lua-5.4.6/src
luac -o luac.out Main.lua

elif [[ $action == "check" ]]; then
  if [[ ! -e luac.out ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  lua luac.out
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
