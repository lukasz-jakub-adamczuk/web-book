#!/bin/bash

cd src/chapters/html
cat $(cat ../../../chpt-html.list) > ../../../tmp/html.md

cd ../css
cat $(cat ../../../chpt-css.list) > ../../../tmp/css.md

cd ../js
cat $(cat ../../../chpt-js.list) > ../../../tmp/js.md


cd ../../../tmp
cat html.md css.md js.md > tips-and-tricks.md

