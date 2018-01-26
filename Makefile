
all: cv.html README.md

README.md: cv.md
	pandoc -t gfm -o $@ $<

cv.html: cv.md
	pandoc -t html -s -Mtitle=Francky -o $@ $<

clean:
	rm -f *.html *.pdf README.md
