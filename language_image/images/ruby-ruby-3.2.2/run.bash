#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
ruby -c Main.rb && touch syntax_ok

elif [[ $action == "check" ]]; then
  if [[ ! -e syntax_ok ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  ruby --jit --yjit-exec-mem-size=128 Main.rb
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
