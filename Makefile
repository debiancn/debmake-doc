# Build all Debian packaging examples and produce documentation
# Copyright (C) 2015 Osamu Aoki

# run "make prep" before commit

all: build

include Makefile.common
include Makefile.pkg
include Makefile.dbk

# Normal doc content build generating full packaging log
build: pkg
	$(MAKE) -C $(ASCIIDOC_DIR) xml	# base XML documentation

# Quick doc content build without touching packaging log for proofing
update:
	$(MAKE) -C $(ASCIIDOC_DIR) xml	# base XML documentation
	-mkdir -p $(TMPDIR)
	-mkdir -p $(BASEDIR)/html
	$(MAKE) css html # build docs from XML

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

# Use this target on devel branch source
package:
	debmake -t -y -zx -b':doc' -i pdebuild

.PHONY: all build clean
