#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
export NO_COLOR=true
export DENO_NO_UPDATE_CHECK=1
export PATH=$PATH:/home/runner/.deno/bin

# キャッシュしつつ、import・型・構文などをチェック
if deno cache --quiet --check Main.ts > check-output 2>&1 ; then
    touch ok
else
  cat check-output 1>&2
  if grep -q "error sending request for url (http" check-output 2>/dev/null; then
    # ライブラリをダウンロードしようとした場合はヒントを表示
    echo "---" 1>&2
    echo "Tips from the judge system: The only available external libraries are:" 1>&2
    echo "- std@0.194.0" 1>&2
    echo "- npm:tstl@2.5.13" 1>&2
    echo "- npm:mathjs@11.8.2" 1>&2
    echo "Please make sure to specify the version number when importing." 1>&2
  fi
fi

elif [[ $action == "check" ]]; then
  if [[ ! -e ok ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  deno run --allow-all --quiet --no-prompt --v8-flags=--stack-size={memory:kb} Main.ts ONLINE_JUDGE ATCODER
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
