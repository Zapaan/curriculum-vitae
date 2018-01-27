
all: cv.html README.md

install:
	scripts/install-hooks.sh

README.md: cv.md
	pandoc -t gfm -o $@ $<

cv.html: cv.md
	sed -E 's/(.+)@(.+)\.(.+)/\1 __*at*__ \2 **_dot_** \3/g' $< \
	| pandoc -t html -s -Mpagetitle=Francky -c reset.css -c cv.css -o $@

clean:
	rm -f *.html *.pdf README.md
