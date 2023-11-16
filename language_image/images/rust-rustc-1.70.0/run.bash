#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
cargo build --release --quiet --offline

elif [[ $action == "check" ]]; then
  if [[ ! -e target/release/main ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  ./target/release/main
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
