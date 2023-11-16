#!/bin/bash

action=$1

if [[ $action == "compile" ]]; then
  
$HOME/.sdkman/candidates/kotlin/current/bin/kotlinc ./Main.kt -include-runtime -jvm-target 19 -d ./Main.jar

elif [[ $action == "check" ]]; then
  if [[ ! -e Main.jar ]]; then
    echo 1
  else
    echo 0
  fi
elif [[ $action == "run" ]]; then
  /usr/lib/jvm/java-19-openjdk-amd64/bin/java -cp ./Main.jar -Xss{memory:mb}M -DONLINE_JUDGE=true MainKt
  if [[ $? -ne 0 ]]; then
    echo "Run failed"
    exit 1
  fi
else
  echo 'Unknown action "'$action'"'
  exit 1
fi
