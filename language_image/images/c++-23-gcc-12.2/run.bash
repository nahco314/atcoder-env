#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
g++-12 -std=gnu++2b -O2 -DONLINE_JUDGE -DATCODER \
 -Wall -Wextra \
 -mtune=native -march=native \
 -fconstexpr-depth=2147483647 -fconstexpr-loop-limit=2147483647 -fconstexpr-ops-limit=2147483647 \
 -I/opt/ac-library -I/opt/boost/gcc/include -L/opt/boost/gcc/lib \
 -o a.out Main.cpp \
-lgmpxx -lgmp \
-I/usr/include/eigen3

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
