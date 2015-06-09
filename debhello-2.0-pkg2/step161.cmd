L "echo 'fr' > po/LINGUAS"
L "cp po/debhello.pot po/fr.po"
echo  " $ vim po/fr.po"
echo " ... hack, hack, hack, ..."
cp -f ../../../debhello-3.3/po/fr.po po/fr.po
L "cat po/fr.po"

