#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
export SBCL_HOME=/usr/local/lib/sbcl
./sbcl --noinform --eval '(compile-file "Main.lisp")' --quit
if [ -f Main.fasl ]; then
  chmod +x Main.fasl
fi

elif [[ $action == "check" ]]; then
  if [[ ! -e Main.fasl ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  ./Main.fasl
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
