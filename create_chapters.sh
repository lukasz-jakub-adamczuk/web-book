#!/bin/bash

cd src/chapters/xhtml
cat $(cat ../../../chpt-xhtml.list) > ../../../tmp/xhtml.md

cd ../html5
cat $(cat ../../../chpt-html5.list) > ../../../tmp/html5.md

cd ../css
cat $(cat ../../../chpt-css.list) > ../../../tmp/css.md

cd ../css3
cat $(cat ../../../chpt-css3.list) > ../../../tmp/css3.md

cd ../js
cat $(cat ../../../chpt-js.list) > ../../../tmp/js.md


cd ../../../tmp
cat xhtml.md html5.md css.md css3.md js.md > tips-and-tricks.md

