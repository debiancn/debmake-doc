echo " ... hack, hack, hack, ..."
sed -i -e 's/printf(\([^)]*\))/printf(_(\1))/' \
       -e 's/^int/#define _(string) gettext (string)\nint/' \
       src/hello.c
L "cat src/hello.c"
