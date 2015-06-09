# Build all Debian packaging examples and produce documentation
# Copyright (C) 2015 Osamu Aoki

# run "make prep" before commit

all: build

include Makefile.common
include Makefile.pkg
include Makefile.dbk

build: pkg
	$(MAKE) -C $(ASCIIDOC_DIR) xml	# base XML documentation

install:
	-mkdir -p $(TMPDIR)
	-mkdir -p $(BASEDIR)/html
	$(MAKE) css html pdf epub txt # build docs from XML
#ifndef DEBUG
	-rm -rf $(TMPDIR) # remove all $(TMPDIR) contents
#endif

clean::
	-rm -rf $(TMPDIR)
	-$(MAKE) -C $(ASCIIDOC_DIR) clean

distclean:: clean

.PHONY: all build clean
