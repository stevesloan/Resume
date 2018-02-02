all:    resume.html resume.docx resume.pdf

%.html: %.md
	sed 's/XXX-XXX-XXXX/'$(PHONE)'/g' $< | \
		pandoc -s --css resume.css -t html5 \
		--metadata=pagetitle:"Steve Sloan - Resume" \
		-o "Steve Sloan - Resume.html" 

%.docx: %.md
	sed 's/XXX-XXX-XXXX/'$(PHONE)'/g' $< | \
		pandoc -s -t docx \
		--reference-doc=resume-reference.docx \
		-o "Steve Sloan - Resume.docx"

%.pdf:  %.md
	markdown2pdf --template=resume-template.tex --xetex $<

clean:
	rm *.html *.log *.pdf *.docx
