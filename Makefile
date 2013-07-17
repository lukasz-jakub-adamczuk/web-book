#include_dir=build
source=src/chapters/css/*.md
title='Tips and tricks for the Web'
filename='tips-and-tricks'

all: pdf

#for chapter in html css js
#do
#	awk 'FNR==1{print ""}{print}' src/chapters/$(chapter)/*.md > tmp/$(chapter).md
#done

#awk 'FNR==1{print ""}{print}' src/chapters/css/*.md > tmp/css.md
#awk 'FNR==1{print ""}{print}' src/chapters/js/*.md > tmp/js.md

markdown:
	awk 'FNR==1{print ""}{print}' $(source) > $(filename).md

#awk 'FNR==1{print ""}{print}' tmp/*.md > tips-and-tricks.md

pdf: markdown
#pdf:
	# You need `pdflatex`
	# OS X: http://www.tug.org/mactex/
	# Then find its path: find /usr/ -name "pdflatex"
	# Then symlink it: ln -s /path/to/pdflatex /usr/local/bin
	pandoc -s $(filename).md -o $(filename).pdf \
		--title-prefix $(title) \
		--normalize \
		--smart \
		--toc \
		--latex-engine=xelatex 


