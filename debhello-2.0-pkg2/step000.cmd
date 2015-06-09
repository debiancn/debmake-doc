# Fake download session
echo " \$ wget http://www.example.org/download/debhello-2.0.tar.gz"
echo " ..."
# Reality behind scene
cp -a ${COMMONDIR}/debhello-2.0.${TGZ} ${TESTDIR}/debhello-2.0.${TGZ}
CD ${TESTDIR} >/dev/null
cd ${TESTDIR}
L "tar -xzmf debhello-2.0.tar.gz"
L "tree"
