# Build all Debian packaging examples and produce documentation
# Copyright (C) 2015 Osamu Aoki

# Define if not defined (Prevent error when Make is run independently)
SOURCE_DATE_EPOCH ?= "1400000000"

# run "make prep" before commit

#ifndef DEBUG
PKG =
#else
PKG = pkg
#endif

all: build

include Makefile.common
include Makefile.pkg
include Makefile.dbk

build: $(PKG) $(wildcard $(ASCIIDOC_DIR)/*.txt)
	# process ASCIIDOC after $(pkg) targets even under the parallel build
	$(MAKE) base-xml
	echo "DEBUG='$(DEBUG)'"
	echo "LANGPO='$(LANGPO)'"
	echo "LANGALL='$(LANGALL)'"
	echo "NOPDF='$(NOPDF)'"
	echo "BASEDIR='$(BASEDIR)'"
	echo "TMPDIR='$(TMPDIR)'"
	$(MAKE) all-xml	                # XML docs for all PO
	-mkdir -p $(TMPDIR)
	-mkdir -p $(BASEDIR)/html
	# leave fuzzy status in the package build log
	-cat fuzzy.log

install: css html pdf epub txt # build docs from XML
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

.PHONY: all build install clean distclean package
