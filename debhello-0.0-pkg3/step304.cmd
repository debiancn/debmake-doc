CD ${PROJECT}
cd ${PROJECT}
: > debian/patches/series
L "dquilt new 000-prefix-usr.patch"
L "dquilt add Makefile"
echo " ... hack, hack, hack, ..."
sed -i -e 's/\/usr\/local/\/usr/' Makefile
L "head -1 Makefile"
L "dquilt refresh"
echo " \$ dquilt header -e --dep3"
dquilt header -a >/dev/null <<EOF
Description: set prefix=/usr patch
Author: Osamu Aoki <osamu@debian.org>
EOF
echo " ... edit the DEP-3 patch header with editor"
#L "dquilt pop -a"
L "tree -a"
L "cat debian/patches/series"
L "cat debian/patches/000-prefix-usr.patch"

