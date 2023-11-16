#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
gcc-12 -std=gnu2x -O2 -DONLINE_JUDGE -DATCODER -o a.out Main.c -lm

elif [[ $action == "check" ]]; then
  if [[ ! -e a.out ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  ./a.out
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
