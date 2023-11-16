#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
export FFLAGS="-O2 -std=f2018"
cmake -B build -DCMAKE_BUILD_TYPE=NoConfig
cmake --build build

elif [[ $action == "check" ]]; then
  if [[ ! -e build/main ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  ./build/main
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
