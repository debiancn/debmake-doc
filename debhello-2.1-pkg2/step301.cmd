echo " \$ vim ${PROJECT}/debian/rules"
echo " ... hack, hack, hack, ..."
cat - >${PROJECT}/debian/rules <<EOF
#!/usr/bin/make -f
export DH_VERBOSE = 1
export DEB_BUILD_MAINT_OPTIONS = hardening=+all
export DEB_CFLAGS_MAINT_APPEND  = -Wall -pedantic
export DEB_LDFLAGS_MAINT_APPEND = -Wl,--as-needed

%:
	dh \$@


override_dh_auto_configure:
	dh_auto_configure -- \\
	      -DCMAKE_LIBRARY_ARCHITECTURE="\$(DEB_TARGET_MULTIARCH)"
EOF
L "cat ${PROJECT}/debian/rules"

