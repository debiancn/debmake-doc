#include "config.h"
#include <stdio.h>
#include <libintl.h>
#include <locale.h>
#define _(string) gettext (string)
int
main()
{
        setlocale(LC_ALL,"");
        bindtextdomain(PACKAGE_NAME, LOCALEDIR);
        textdomain(PACKAGE_NAME);
        printf(_("Hello, my name is %s!\n"), PACKAGE_AUTHOR);
        return 0;
}
