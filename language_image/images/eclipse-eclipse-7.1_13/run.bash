#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
export PATH=$PATH:/judge/eclipse/bin/x86_64_linux
echo "compile('Main.ecl', [output: eco, debug: off])" | eclipse -f Main.ecl

elif [[ $action == "check" ]]; then
  if [[ ! -e Main.eco ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  eclipse -f Main.eco -e main
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
