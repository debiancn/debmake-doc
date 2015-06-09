# update simple template files
mkdir -p debhello-3.3/debian/source
for f in \
	README.Debian \
	changelog \
	watch \
	compat \
	copyright \
	source/format \
	source/local-options \
	; do
echo " \$ vim debhello-3.3/debian/$f"
echo " ... hack, hack, hack, ..."
cp -f ${COMMONDIR}/${PROJECT}/debian/$f debhello-3.3/debian/$f
L "cat debhello-3.3/debian/$f"
done

