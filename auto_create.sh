#!/bin/sh

cat ./src/chapters/css/*.md > ./tmp/css.md
cat ./src/chapters/js/*.md > ./tmp/js.md

cat tmp/*.md > tips-and-tricks.md