
all: cv.html

cv.html: cv.md
	pandoc -t html -s -Mtitle=Francky -o $@ $<

clean:
	rm -f *.html *.pdf
