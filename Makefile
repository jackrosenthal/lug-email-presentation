LATEX = xelatex
TARGETS = email.pdf

all: $(TARGETS)

%.pdf: %.tex lug.cls
	$(LATEX) -shell-escape $<
	while grep 'Rerun to get ' $*.log ; do $(LATEX) -shell-escape $<; done

clean:
	rm -f $(TARGETS)
	rm -f *.log *.nav *.aux *.out *.snm *.toc *.vrb
	rm -rf _minted-*
