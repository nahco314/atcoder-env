#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
export PATH=$HOME/.nimble/bin:$PATH
nim cpp -d:release --opt:speed --multimethods:on --warning[SmallLshouldNotBeUsed]:off --hints:off -o:a.out Main.nim

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
