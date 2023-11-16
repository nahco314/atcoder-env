#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
mono produire-mono/rdrc.exe /mono /console produire-mono/Main.rdr > compile-out
result=$(tail -1 compile-out)
if [ "$result" = "失敗しました。" ]; then
  rm produire-mono/Main.exe
  cat compile-out 1>&2
fi

elif [[ $action == "check" ]]; then
  if [[ ! -e produire-mono/Main.exe ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  mono produire-mono/Main.exe
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
