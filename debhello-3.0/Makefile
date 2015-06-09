prefix = /usr/local

all: data/hello.desktop po/ja.mo

data/hello.desktop po/ja.mo:
	$(MAKE)  -C po all

install: all
	install -D scripts/hello $(DESTDIR)/$(prefix)/bin/hello
	install -m 644 -D data/hello.desktop \
		$(DESTDIR)$(prefix)/share/applications/hello.desktop
	install -m 644 -D data/hello.png \
		$(DESTDIR)$(prefix)/share/pixmaps/hello.png
	install -m 644 -D man/hello.1 \
		$(DESTDIR)$(prefix)/share/man/man1/hello.1
	install -m 644 -D po/ja.mo \
		$(DESTDIR)$(prefix)/share/locale/ja/LC_MESSAGES/debhello.mo

clean:
	$(MAKE)  -C po clean

distclean: clean

uninstall:
	-rm -f $(DESTDIR)$(prefix)/bin/hello
	-rm -f $(DESTDIR)$(prefix)/share/applications/hello.desktop
	-rm -f $(DESTDIR)$(prefix)/share/pixmaps/hello.png
	-rm -f $(DESTDIR)$(prefix)/share/man/man1/hello.1
	-rm -f $(DESTDIR)$(prefix)/share/locale/ja/LC_MESSAGES/debhello.mo

.PHONY: all install clean distclean uninstall
