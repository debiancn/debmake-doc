echo " \$ vim debian/copyright"
echo " ... hack, hack, hack, ..."
cp -f ${COMMONDIR}/${PROJECT}/debian/copyright debian/copyright
L "cat debian/copyright"
CD ..
cd ..

