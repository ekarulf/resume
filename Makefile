MAINFILE := erik_karulf_resume

all: $(MAINFILE).pdf

$(MAINFILE).pdf: *.tex
	# Ensure the private.tex file exists
	test -f private.tex || touch private.tex
	# pdflatex needs to be run twice
	pdflatex $(MAINFILE) && bibtex $(MAINFILE) && pdflatex $(MAINFILE) && pdflatex $(MAINFILE)
	# Cheap hack to keep Dropbox in sync
	- test -f ~/Dropbox/Public/$(MAINFILE).pdf && cp -f $(MAINFILE).pdf ~/Dropbox/Public/$(MAINFILE).pdf

clean:
	- rm -f $(MAINFILE).aux $(MAINFILE).log $(MAINFILE).out

cleanpdf:
	- rm -f $(MAINFILE).pdf
