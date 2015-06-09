echo " ... hack, hack, hack, ..."
sed -e 's/^PACKAGE_GNU.*/PACKAGE_GNU = no/' \
    -e 's/^COPYRIGHT_HOLDER.*/COPYRIGHT_HOLDER = Osamu Aoki <osamu@debian.org>/' \
    po/Makevars.template > po/Makevars
L "diff -u po/Makevars.template po/Makevars"
L "rm po/Makevars.template"
