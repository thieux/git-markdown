#!/bin/bash

function catRevision() {
  git checkout 2b74b22214bca0264a1f9db9ebea2a3a85efc1c3
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
catRevision > /tmp/article.md
pandoc /tmp/article.md -s -o /tmp/article.pdf
evince /tmp/article.pdf&

