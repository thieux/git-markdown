#!/bin/bash

cd simple-lang
git checkout 2b74b22214bca0264a1f9db9ebea2a3a85efc1c3
for f in `find src -iname '*.java'`; do
  echo $f
  echo
  echo '```java'
  cat "$f" 
  echo '```'
  echo
done

