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

cd simple-lang
git checkout master

if [ -e /tmp/article.md ]; then
  rm /tmp/article.md
fi

for revision in `git log | tac | grep commit | cut -d ' ' -f 2`; do
  echo "$revision"
  message=`git show --oneline $revision | head -n1 | cut -c9-`
  catRevision "$revision" "$message" >> /tmp/article.md
done

pandoc /tmp/article.md -s -o /tmp/article.html
firefox /tmp/article.html&
