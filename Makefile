
all: cv.html README.md

install:
	scripts/install-hooks.sh

README.md: cv.md
	pandoc -t gfm -o $@ $<

cv.html: cv.md
	pandoc -t html -s -Mpagetitle=Francky -c cv.css -o $@ $<

clean:
	rm -f *.html *.pdf README.md
