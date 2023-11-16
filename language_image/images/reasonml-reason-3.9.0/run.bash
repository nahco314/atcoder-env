#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
cd main
eval $(opam env)
dune build --release

elif [[ $action == "check" ]]; then
  if [[ ! -e main/_build/default/bin/main.exe ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  ./main/_build/default/bin/main.exe
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
