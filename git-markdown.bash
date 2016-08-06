#!/bin/bash

function catRevision() {
  local revision="$1"

  git checkout "$revision"
  for f in `find src -iname '*.java'`; do
    echo $f
    echo
    echo '```java'
    cat "$f" 
    echo '```'
    echo
  done
}

cd simple-lang
catRevision '2b74b22214bca0264a1f9db9ebea2a3a85efc1c3' > /tmp/article.md
pandoc /tmp/article.md -s -o /tmp/article.pdf
evince /tmp/article.pdf&
