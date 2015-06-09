for f in \
	debhello.install \
	libsharedlib1.install \
	libsharedlib-dev.install \
	; do
echo " \$ vim debhello-3.3/debian/$f"
echo " ... hack, hack, hack, ..."
cp -f ${COMMONDIR}/${PROJECT}/debian/$f debhello-3.3/debian/$f
L "cat debhello-3.3/debian/$f"
done

