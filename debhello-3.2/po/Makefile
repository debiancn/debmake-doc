all: ja.mo ../data/hello.desktop

pot: debhello.pot

../src/hello: ../src/hello.c
	$(MAKE) -C .. src/hello

debhello.pot: ../src/hello ../data/hello.desktop.in
	xgettext -d debhello -L Desktop ../data/hello.desktop.in -o $@
	xgettext -d debhello -j -L C -k_ ../src/hello.c -o $@

%.po: debhello.pot FORCE
	msgmerge -U $@ debhello.pot

%.mo: %.po
	msgfmt $< -o $@

../data/hello.desktop: ../data/hello.desktop.in
	msgfmt --desktop --template $< -d ./ -o $@

clean:
	-rm -f *.mo *~
	-rm -f ../data/hello.desktop

FORCE:
