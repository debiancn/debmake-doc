for deb in $(ls *.deb); do
L "dpkg -f ${deb} pre-depends depends recommends conflicts breaks"
done
