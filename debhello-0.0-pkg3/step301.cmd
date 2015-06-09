echo " \$ vim ${PROJECT}/debian/rules"
echo " ... hack, hack, hack, ..."
cp -f ${COMMONDIR}/${PROJECT}/debian/rules-2 ${PROJECT}/debian/rules
L "cat ${PROJECT}/debian/rules"

