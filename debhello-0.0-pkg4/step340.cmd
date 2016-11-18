# This is cheating :-)
cat  >debian/source/local-patch-header <<EOF
Description: set prefix to /usr
Author: "Firstname Lastname" <email.address@example.org>

EOF
: > debian/patches/series
# fool dpkg-source and timeout safely
echo " \$ dpkg-source --commit . 000-prefix-usr.patch"
expect -c "
set timeout 3
spawn dpkg-source --commit . 000-prefix-usr.patch
expect \"^ all: src/hello\"
send ':wq\n'
exit
" | sed -e 1d -e 's/\r//'
