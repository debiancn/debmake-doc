# Gettextize (initial)
CD ${PROJECT}
cd ${PROJECT}
# fool gettextize and timeout safely
echo " $ gettextize"
expect -c "
set timeout 3
spawn gettextize
expect \"^Press Return to acknowledge.*\"
exit
" | sed -e 1d -e 's/\r//'
L "rm -rf m4 build-aux *~"
