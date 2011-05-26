MAINFILE := erik_karulf_resume

all: $(MAINFILE).pdf

$(MAINFILE).pdf: *.tex *.bib
	# Ensure the private.tex file exists
	test -f private.tex || touch private.tex
	# pdflatex needs to be run twice
	pdflatex $(MAINFILE) && bibtex $(MAINFILE) && pdflatex $(MAINFILE) && pdflatex $(MAINFILE)

upload: $(MAINFILE).pdf
	# Cheap hack to keep Dropbox in sync
	- test -f ~/Dropbox/Public/$(MAINFILE).pdf && cp -f $(MAINFILE).pdf ~/Dropbox/Public/$(MAINFILE).pdf
	# Upload via scp to erik.karulf.com
	- scp $(MAINFILE).pdf yoshi.fort-awesome.net:/www/erik.karulf.com/public/$(MAINFILE).pdf

clean:
	- rm -f $(MAINFILE).aux $(MAINFILE).log $(MAINFILE).out
	- rm -f $(MAINFILE).bbl $(MAINFILE).blg

cleanpdf:
	- rm -f $(MAINFILE).pdf
