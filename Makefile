TEX = pdflatex 
BIB = bibtex

all: main

main: main.tex main.pdf
	$(TEX) main.tex
main.aux: main.tex
	$(TEX) main.tex
main.bbl: main.aux
	$(BIB) main.aux
main.pdf: main.bbl
	$(TEX) main.tex
view: main
	evince main.pdf
shrink: main
	gs -dNOPAUSE -dBATCH -sDEVICE=pdfwrite -dCompatibilityLevel=1.4  -sOutputFile=output.pdf main.pdf 
