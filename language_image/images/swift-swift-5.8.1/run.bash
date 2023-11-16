#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
export PATH=/usr/local/swift/usr/bin:$PATH
swift build -Xswiftc -O -Xlinker -lm -c release 1>&2

elif [[ $action == "check" ]]; then
  if [[ ! -e .build/release/Main ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  ./.build/release/Main
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
