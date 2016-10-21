CD ${PROJECT}
cd ${PROJECT}
L "ls -l debian/patches/"
L "cat debian/patches/series"
echo "vi Makefile"
echo " ... hack, hack, hack, ..."
sed -i -e 's/\/usr\/local/$(DESTDIR)\/usr/' Makefile
L "cat Makefile"
CD ..
cd ..

