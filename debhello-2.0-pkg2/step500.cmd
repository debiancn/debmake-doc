# make deb
CD ${PROJECT}
cd ${PROJECT}
echo " \$ debuild"
debuild -i -us -uc
