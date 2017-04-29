for deb in *.deb; do
L "dpkg -f ${deb} pre-depends depends recommends conflicts breaks"
done
