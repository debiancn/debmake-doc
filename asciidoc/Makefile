# Build 1-page html, manpage, and xml source
# Copyright (C) 2015 Osamu Aoki

# manually copy 1-page html to the people.debian.org
# manually copy manpage to the debmake command
# xml is used to build this package
# This Makefile can function by itself.

# version of the debmake command used
DEBMAKEVERSION ?= $(shell { debmake -v 2>&1 | sed -ne '/^debmake/s/^.*(version: \([0-9.]*\)).*$$/\1/p' ; })
# version of this Debian package (debian/changelog)
DEBVERSION ?= $(shell { cd .. >/dev/null ;dpkg-parsechangelog -SVersion || echo "vcs-0.0" ; })
# short date of this Debian package (debian/changelog)
DEBDATE ?= $(shell { cd .. >/dev/null && date +'%Y-%m-%d' -d"`dpkg-parsechangelog -SDate`" || date +'(No changelog) %Y-%m-%d' ; })

MANUAL := debmake-doc
GENTXT := 99-manpage.txt binary.txt caveat.txt
ALLTXT := $(wildcard *.txt) $(GENTXT)

# These are used as test build target
all: man html

test: test.html

html: $(MANUAL).html

# This is used from the parent directory to build debmake-doc
xml: $(MANUAL).xml

# This is used to make manpage for debmake
# Copy result to debmake
man: debmake.1

check:
	@echo "DEBMAKEVERSION = $(DEBMAKEVERSION)"
	@echo "DEBVERSION     = $(DEBVERSION)"
	@echo "DEBDATE        = $(DEBDATE)"
	@echo "ALLTXT         = $(ALLTXT)"

99-manpage.txt: manpage.txt
	sed -e 's/^= DEBMAKE(1)$$/= *debmake*(1) manpage/' -e 's/^=/==/' manpage.txt >99-manpage.txt

binary.txt: manpage.txt
	sed -n -e '/^\*-b\*/,$$p' manpage.txt | sed -e '/^\*-e\*/,$$d'>binary.txt

caveat.txt: manpage.txt
	sed -e '1,/^== CAVEAT/d' manpage.txt | sed -e '/^== DEBUG/,$$d'>caveat.txt

$(MANUAL).xml: $(ALLTXT)
	@$(call check-command, asciidoc, asciidoc)
	asciidoc --doctype book\
		-b docbook \
		-a 'newline=\n' \
		$(MANUAL).txt

test.xml: test.txt
	@$(call check-command, asciidoc, asciidoc)
	asciidoc --doctype book\
		-b docbook \
		-a 'newline=\n' \
		$<

%.html: $(ALLTXT)
	cp -f $(MANUAL).txt $(MANUAL).keep
	sed -i -e 's/^\/\/####//' $(MANUAL).txt
	asciidoc \
		-a toc2 \
		-a 'newline=\n' \
		$*.txt
	mv -f $(MANUAL).keep $(MANUAL).txt

debmake.1: manpage.txt
	a2x --doctype manpage --format manpage \
		manpage.txt

# This PDF is not used by debmake-doc
$(MANUAL).pdf: $(ALLTXT)
	@$(call check-command, asciidoc, asciidoc)
	a2x -v --doctype book --format pdf --dblatex-opts="-b xetex"\
		-a 'newline=\n' \
		$(MANUAL).txt
clean:
	-rm -f $(GENTXT)
	-rm -f *.xml
	-rm -f *.html
	-rm -f debmake.1
	-rm -f *~

distclean: clean

remote: $(MANUAL).html
	scp $(MANUAL).html people.debian.org:~osamu/public_html/$(MANUAL).html

.PHONY: all xml html man clean distclean check test remote
