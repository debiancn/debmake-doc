all: src/hello

src/hello: src/hello.c
	$(CC) $(CPPFLAGS) $(CFLAGS) $(LDCFLAGS) -o $@ $^

install: src/hello
	install -D src/hello \
		/usr/local/bin/hello

clean:
	-rm -f src/hello

distclean: clean

uninstall:
	-rm -f /usr/local/bin/hello

.PHONY: all install clean distclean uninstall
