# This is cheating :-) dpkg-source isn't easy
echo " \$ dpkg-source --commit . 000-prefix-usr.patch"
echo " ... edit the DEP-3 patch header with editor"
# But in reality, use quilt to record.
dquilt refresh >/dev/null
dquilt header -a >/dev/null <<EOF
Description: set prefix=/usr patch
Author: Osamu Aoki <osamu@debian.org>
EOF
# dpkg-source doesn't add ===== line, so fake it
sed -i -e 's/^=*$//g' debian/patches/000-prefix-usr.patch 
