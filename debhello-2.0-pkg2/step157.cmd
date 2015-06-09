echo " ... hack, hack, hack, ..."
echo 'src/hello.c' >po/POTFILES.in
echo 'lib/sharedlib.c' >>po/POTFILES.in
echo 'data/hello.desktop.in' >>po/POTFILES.in
L "cat po/POTFILES.in"
