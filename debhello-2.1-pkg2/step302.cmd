echo " \$ vim ${PROJECT}/debian/control"
echo " ... hack, hack, hack, ..."
sed  -e '/^Package: libsharedlib1-dbg/,$d' \
		< ${COMMONDIR}/${PROJECT}/debian/control \
		> ${PROJECT}/debian/control
L "cat ${PROJECT}/debian/control"

