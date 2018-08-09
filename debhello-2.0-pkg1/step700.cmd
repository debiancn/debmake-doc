for deb in $(ls *.deb); do
L "dpkg -c ${deb}" | sed -e 's/root.root...............-..-.. ..:../root\/root ... /'
done
