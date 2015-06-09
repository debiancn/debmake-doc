FILE=$(ls *.tar.?z | \
	grep -v 'orig.tar.gz' |\
	grep -v 'orig.tar.xz' )
for f in $FILE ; do
EXT=${f##*.}
if [ "$EXT" = "gz" ]; then
L "tar -tzf $f"
elif [ "$EXT" = "xz" ]; then
L "tar --xz -tf $f"
else
:
fi
done
