#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
export PATH=/opt/haxe_20230428195743_964c84c:$PATH
haxe -D analyzer-optimize --jvm Main.jar --main Main

elif [[ $action == "check" ]]; then
  if [[ ! -e Main.jar ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  java -jar Main.jar
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
