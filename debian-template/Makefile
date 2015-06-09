# Generic build script
DEBEMAIL:=email.address@example.org
DEBFULLNAME:="Firstname Lastname"
export DEBEMAIL DEBFULLNAME
ROOTDIR:=$(CURDIR)
TESTDIR:=$(CURDIR)/test
COMMONDIR:=$(abspath $(CURDIR)/..)
PATH := $(COMMONDIR)/bin:$(PATH)
PROJECT:=$(shell echo $(notdir $(CURDIR))|sed -e 's/-pkg[0-9]*$$//' )
PROJECTDIR:=$(TESTDIR)/$(PROJECT)
TERM:=xterm
TREE_COLORS:=
LS_COLORS:=
CDPATH:=
FILTER :=s/\(^.............................................................................\).*$$/\1.../
TGZ:=tar.gz
export ROOTDIR TESTDIR COMMONDIR PATH PROJECT PROJECTDIR TREE_COLORS LS_COLORS TERM CDPATH TGZ

stepcmds := $(sort $(wildcard *.cmd))
steps := $(patsubst %.cmd, %, $(stepcmds))

all:
	mkdir -p $(TESTDIR)
	echo $(ROOTDIR) > $(ROOTDIR)/next.dir
	echo $(PROJECT) > $(ROOTDIR)/project
	for i in $(steps) ; do \
	cd $$(cat $(ROOTDIR)/next.dir) >/dev/null ; \
	script -e -q -c $(ROOTDIR)/$$i.cmd $(ROOTDIR)/$$i.log ; \
	ERR=$$? ; \
	cat $(ROOTDIR)/$$i.log | col -b -x | \
	sed -e 's#$(TESTDIR)#/path/to#g' | \
	sed -e '$(FILTER)' > $(ROOTDIR)/$$i.slog ; \
	if [ x$$ERR != x0 ]; then exit 1 ; fi ; \
	done

clean:
	-rm -rf $(TESTDIR)
	-rm -rf debmake
	-rm -rf package
	-rm -f .stamp
	-rm -f *.log
	-rm -rf next.dir project

distclean: clean
	-rm -f *.slog
	-rm -f *.patch

step%.raw: step%.cmd
	./$^ >$@


check:
	@echo "TESTDIR=$(TESTDIR)"
	@echo "PROJECT=$(PROJECT)"

.PHONY: all clean distclean check
