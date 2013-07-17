#include_dir=build
source=src/chapters/css/*.md
title='Tips and tricks for the Web'
filename='tips-and-tricks'

all: pdf

markdown:
	awk 'FNR==1{print ""}{print}' $(source) > $(filename).md


#pdf: markdown
pdf:
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

