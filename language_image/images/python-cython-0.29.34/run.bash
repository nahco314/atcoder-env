#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
python3.11 -c "from Cython.Build import cythonize;from Cython.Compiler import Options;Options.embed='main';cythonize('Main.pyx', language='c++', compiler_directives={'language_level':'3'})"
g++ -Wno-deprecated-declarations -O2 -fPIC -I/usr/local/include/python3.11 -I$HOME/.local/lib/python3.11/site-packages/numpy/core/include -o a.out Main.cpp -lpython3.11

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
