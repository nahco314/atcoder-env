#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
eval $(opam env) ocamlfind ocamlopt -O2 -o a.out \
main.ml -linkpkg -thread \
-package str,num,threads,containers,core,iter,batteries

elif [[ $action == "check" ]]; then
  if [[ ! -e a.out ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  ./a.out
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
