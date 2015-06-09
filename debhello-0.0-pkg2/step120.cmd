L "cp -a ${PROJECT} ${PROJECT}.orig"
echo " \$ vim ${PROJECT}/Makefile"
echo " ... hack, hack, hack, ..."
sed -i -e 's/\/usr\/local/\/usr/'  ${PROJECT}/Makefile
L "diff -Nru ${PROJECT}.orig ${PROJECT} >000-prefix-usr.patch" || true
L "cat 000-prefix-usr.patch"
L "rm -rf ${PROJECT}"
L "mv -f ${PROJECT}.orig ${PROJECT}"

