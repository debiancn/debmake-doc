# clean excess template files
for f in \
	clean \
	debhello.doc-base \
	debhello.docs \
	debhello.examples \
	debhello.info \
	debhello.links \
	debhello.manpages \
	debhello.menu \
	debhello.postinst \
	debhello.postrm \
	debhello.preinst \
	debhello.prerm \
	; do
L "rm -f  debhello-3.3/debian/$f"
done
