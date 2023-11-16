#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
./nibbles -hs Main.nbl && ~/.ghcup/bin/ghcup --offline run --quick --ghc 8.10.7 -- ghc -O2 out.hs

elif [[ $action == "check" ]]; then
  if [[ ! -e out ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  ./out
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
