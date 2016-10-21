CD ${PROJECT}
cd ${PROJECT}
echo " \$ vim Makefile"
echo " ... hack, hack, hack, ..."
sed -i -e 's/\/usr\/local/\/usr/' Makefile
L "cat Makefile"

