#!/bin/bash

cd src/chapters/css
cat $(cat ../../../chpt-css.list) > ../../../tmp/css.md

cd ../js
cat $(cat ../../../chpt-js.list) > ../../../tmp/js.md


cd ../../../tmp
cat css.md js.md > tips-and-tricks.md

