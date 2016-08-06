#!/bin/bash

function catRevision() {
  local revision="$1"
  local message="$2"

  git checkout "$revision"

  echo "# $message"

  for f in `find src -iname '*.java'`; do
    echo "## $f"
    echo
    echo '```java'
    cat "$f" 
    echo '```'
    echo
  done
}

function catRevisionList() {
  for revision in `git log | tac | grep commit | cut -d ' ' -f 2`; do
    message=`git show --oneline $revision | head -n1 | cut -c9-`
    catRevision "$revision" "$message"
  done
}

if [ $# -ne 1 ]; then
  echo 'You have to specify a git repository path.'
  exit
else
  cp -R "$1" /tmp/repo
fi

cd /tmp/repo

if [ -e /tmp/article.md ]; then
  rm /tmp/article.md
fi

catRevisionList >> /tmp/article.md
pandoc /tmp/article.md -s -o /tmp/article.html
firefox /tmp/article.html&
