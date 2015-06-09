echo " ... hack, hack, hack, ...(dquilt or gbp-pq)"
mkdir -p ${PROJECT}/debian/patches
cp -f ${COMMONDIR}/${PROJECT}/debian/patches/000-cmake-multiarch.patch ${PROJECT}/debian/patches/000-cmake-multiarch.patch
echo "000-cmake-multiarch.patch" > ${PROJECT}/debian/patches/series
L "cat ${PROJECT}/debian/patches/series"
L "cat ${PROJECT}/debian/patches/000-cmake-multiarch.patch"

