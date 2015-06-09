#include <stdio.h>
#include <libintl.h>
#include <locale.h>
#define _(string) gettext (string)
int
sharedlib()
{
        printf(_("This is a shared library!\n"));
        return 0;
}
