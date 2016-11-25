for f in \
	debhello.install \
	libsharedlib1.install \
	libsharedlib-dev.install \
	; do
echo " \$ vim ${PROJECT}/debian/$f"
echo " ... hack, hack, hack, ..."
cp -f ${COMMONDIR}/${PROJECT}/debian/$f ${PROJECT}/debian/$f
L "cat ${PROJECT}/debian/$f"
done

