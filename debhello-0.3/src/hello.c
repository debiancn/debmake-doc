#include <stdio.h>
#include <string.h>
#define LEN_NAME 10
int
main(int argc, char *argv[])
{
    int i, len;
    char name[LEN_NAME];
    if (argc == 2) {
        for (i=0;argv[1][i]!='\0'; i++) {
            if (argv[1][i] >= 'a' && argv[1][i] <= 'z')
                name[i] = argv[1][i] -'a' + 'A';
            else
                name[i] = argv[1][i];
        }
        name[i] = '\0';
        printf("Hello, %s!\n", name);
    }
    else
        printf("Hello! Run this with one argument!\n");

    return 0;
}
