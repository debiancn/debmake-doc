# Debianize (initial)
CD ${PROJECT}
cd ${PROJECT}
L "debmake"
L " \$ vim debian/source/local-options"
echo " ... hack, hack, hack, ..."
echo "auto-commit" > debian/source/local-options
L "cat debian/source/local-options"
