CD ${PROJECT}
cd ${PROJECT}
# This is cheating ;-)
: > debian/patches/series
dquilt new 000-prefix-usr.patch >/dev/null
dquilt add Makefile >/dev/null
# Pretend to edit Makefile
echo " \$ vim Makefile"
echo " ... hack, hack, hack, ..."
sed -i -e 's/\/usr\/local/\/usr/' Makefile
L "head -n1 Makefile"
