all: ja.mo ../data/hello.desktop

pot: debhello.pot

debhello.pot: ../scripts/hello ../data/hello.desktop.in
	xgettext -d debhello -L desktop ../data/hello.desktop.in -o $@
	xgettext -d debhello -j -L shell ../scripts/hello -o $@

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
