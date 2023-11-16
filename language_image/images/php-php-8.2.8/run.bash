#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
# チェックで問題が無かった場合OKファイルを生成
php -l Main.php && touch OK

elif [[ $action == "check" ]]; then
  if [[ ! -e OK ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  php Main.php
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
