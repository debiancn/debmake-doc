# Fake download session
echo " \$ wget http://www.example.org/download/${PROJECT}.tar.gz"
echo " ..."
# Reality behind scene
cp -a ${COMMONDIR}/${PROJECT}.${TGZ} ${TESTDIR}
CD ${TESTDIR} >/dev/null
cd ${TESTDIR}
L "tar -xzmf ${PROJECT}.tar.gz"
L "tree"
