#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
export DOTNET_EnableWriteXorExecute=0
dotnet publish -c Release -o publish -v q --nologo 1>&2

elif [[ $action == "check" ]]; then
  if [[ ! -e publish/Main ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  ./publish/Main
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
