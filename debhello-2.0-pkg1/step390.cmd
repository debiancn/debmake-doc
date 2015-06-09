# update simple template files
mkdir -p ${PROJECT}/debian/source
for f in \
	README.Debian \
	changelog \
	watch \
	compat \
	copyright \
	source/format \
	source/local-options \
	; do
echo " \$ vim ${PROJECT}/debian/$f"
echo " ... hack, hack, hack, ..."
cp -f ${COMMONDIR}/${PROJECT}/debian/$f ${PROJECT}/debian/$f
L "cat ${PROJECT}/debian/$f"
done

