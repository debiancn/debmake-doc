L "echo '000-prefix-usr.patch' >${PROJECT}/debian/patches/series"
echo " \$ vim 000-prefix-usr.patch"
echo " ... hack, hack, hack, ..."
# add header
echo  "From: Osamu Aoki <osamu@debian.org>" > ${PROJECT}/debian/patches/000-prefix-usr.patch
echo  "Description: set prefix=/usr patch" >> ${PROJECT}/debian/patches/000-prefix-usr.patch
# Remove date from patch
cat 000-prefix-usr.patch | sed -e 's/Makefile\t[23].*$/Makefile/' >>${PROJECT}/debian/patches/000-prefix-usr.patch
echo " \$ mv -f 000-prefix-usr.patch ${PROJECT}/debian/patches/000-prefix-usr.patch"
L "cat ${PROJECT}/debian/patches/000-prefix-usr.patch"

