CD ${PROJECT}
cd ${PROJECT}
L "echo '000-prefix-usr.patch' >debian/patches/series"
echo " \$ vim 000-prefix-usr.patch"
echo " ... hack, hack, hack, ..."
# add header
echo  "From: Osamu Aoki <osamu@debian.org>" > debian/patches/000-prefix-usr.patch
echo  "Description: set prefix=/usr patch" >> debian/patches/000-prefix-usr.patch
# Remove date from patch
cat ../000-prefix-usr.patch | sed -e 's/Makefile\t[23].*$/Makefile/' >>debian/patches/000-prefix-usr.patch
echo " \$ mv -f ../000-prefix-usr.patch debian/patches/000-prefix-usr.patch"
L "cat debian/patches/000-prefix-usr.patch"

