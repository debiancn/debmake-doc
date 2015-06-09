prefix = /usr/local

all: src/hello

src/hello: src/hello.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDFLAGS) -o $@ $^ -lm

install: src/hello
	install -D src/hello \
		$(DESTDIR)$(prefix)/bin/hello
	install -m 644 -D data/hello.desktop \
		$(DESTDIR)$(prefix)/share/applications/hello.desktop
	install -m 644 -D data/hello.png \
		$(DESTDIR)$(prefix)/share/pixmaps/hello.png
	install -m 644 -D man/hello.1 \
		$(DESTDIR)$(prefix)/share/man/man1/hello.1

clean:
	-rm -f src/hello

distclean: clean

uninstall:
	-rm -f $(DESTDIR)$(prefix)/bin/hello
	-rm -f $(DESTDIR)$(prefix)/share/applications/hello.desktop
	-rm -f $(DESTDIR)$(prefix)/share/pixmaps/hello.png
	-rm -f $(DESTDIR)$(prefix)/share/man/man1/hello.1

.PHONY: all install clean distclean uninstall
