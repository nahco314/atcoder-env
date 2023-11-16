#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
cd main && sbt "set offline := true" nativeLink 1>&2

elif [[ $action == "check" ]]; then
  if [[ ! -e main/target/scala-3.3.0/main-out ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  ./main/target/scala-3.3.0/main-out
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
