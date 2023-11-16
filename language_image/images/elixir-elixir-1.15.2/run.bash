#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
export PATH=/home/runner/.asdf/installs/erlang/26.0.2/bin:/opt/elixir/bin:/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin
mix compile

elif [[ $action == "check" ]]; then
  if [[ ! -e _build/dev/lib/judge/ebin/Elixir.Main.beam ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  mix run -e Main.main
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
