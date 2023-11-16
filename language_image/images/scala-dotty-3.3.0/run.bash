#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
scala-cli --power package --bloop-jvm system --jvm system -S 3.3.0 Main.scala -o Main --assembly 2>&1 | ansifilter 1>&2

elif [[ $action == "check" ]]; then
  if [[ ! -e ./Main ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  ./Main
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
