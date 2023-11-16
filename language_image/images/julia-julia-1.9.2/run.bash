#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
export PATH=$PATH:/home/runner/.juliaup/bin
julia -e "Meta.parse(\"begin \" * read(\"Main.jl\",String) * \" end\")" && touch ok
julia Main.jl ONLINE_JUDGE 2> /dev/null

elif [[ $action == "check" ]]; then
  if [[ ! -e ok ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  julia Main.jl
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
