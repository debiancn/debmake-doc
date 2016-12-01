L  "mkdir -p ${PROJECT}/debian"
echo  " $ vim ${PROJECT}/debian/changelog"
echo " ... hack, hack, hack, ..."
cp -f ../../${PROJECT}/debian/changelog ${PROJECT}/debian/changelog
L "cat ${PROJECT}/debian/changelog"

