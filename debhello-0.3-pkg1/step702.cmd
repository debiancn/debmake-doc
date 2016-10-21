for deb in *.deb; do
L "dpkg -f ${deb} pre-depends depends recommends conflics breaks"
done
