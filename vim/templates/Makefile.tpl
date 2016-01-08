NAME=document-name

default: build open

build:
	pandoc_diagrams $(NAME).md | \
				 pandoc --highlight-style tango \
				 -o $(NAME).pdf \
				 --toc \
				 --template ~/.vim/templates/pandoc.tex

open:
	open $(NAME).pdf

clean:
	find -E . -iregex "./[a-z0-9]{32}\.(pdf|png)" | \
			 xargs -J {} rm -f {}
