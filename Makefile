MAINFILE := erik_karulf_resume

all: $(MAINFILE).pdf

$(MAINFILE).pdf: *.tex
	pdflatex $(MAINFILE)

clean:
	- rm -f $(MAINFILE).aux $(MAINFILE).log $(MAINFILE).out

cleanpdf:
	- rm -f $(MAINFILE).pdf
