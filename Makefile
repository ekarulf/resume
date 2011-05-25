MAINFILE := erik_karulf_resume

all: $(MAINFILE).pdf

$(MAINFILE).pdf: *.tex
	# Ensure the private.tex file exists
	test -f private.tex || touch private.tex
	# pdflatex needs to be run twice
	pdflatex $(MAINFILE) && pdflatex $(MAINFILE)

clean:
	- rm -f $(MAINFILE).aux $(MAINFILE).log $(MAINFILE).out

cleanpdf:
	- rm -f $(MAINFILE).pdf
