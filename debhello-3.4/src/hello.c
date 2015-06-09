#include "config.h"
#include <stdio.h>
#include <libintl.h>
#include <locale.h>
#include <sharedlib.h>
#define _(string) gettext (string)
int
main()
{
        setlocale(LC_ALL,"");
        bindtextdomain(PACKAGE, LOCALEDIR);
        textdomain(PACKAGE);
        printf(_("Hello, I am %s!\n"), PACKAGE_AUTHOR);
        sharedlib();
        return 0;
}
