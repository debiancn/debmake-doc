for deb in $(ls *.deb); do
# keep it within 80-chars
echo " \$ dpkg -f ${deb} pre-depends \\"
echo "            depends recommends conflicts breaks"
dpkg -f ${deb} pre-depends depends recommends conflicts breaks
done
