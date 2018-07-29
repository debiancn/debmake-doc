# Build all Debian packaging examples and produce documentation
# Copyright (C) 2015 Osamu Aoki

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


# Normal doc content as English base xml
$(BASEXML):
	$(MAKE) -C $(ASCIIDOC_DIR) xml	# base XML doc

build: $(PKG) $(wildcard $(ASCIIDOC_DIR)/*.txt)
	# process ASCIIDOC after $(pkg) targets even under the parallel build
	$(MAKE) $(BASEXML)
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

preview: css html # build docs from XML

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

.PHONY: all build preview install clean distclean package
