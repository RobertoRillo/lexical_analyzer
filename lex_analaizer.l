%{
#include <stdio.h>

int yywrap(void) { return 1; }

%}

%%
"//".*                                  { printf("COMMENT\n"); }
f[ \t]+[a-z]                            { printf("floatdcl id\n"); }
i[ \t]+[a-z]                            { printf("intdcl id\n"); }
[a-z][ \t]*=[ \t]*[0-9]+               { printf("id assign inum\n"); }
[a-z][ \t]*=[ \t]*[a-z][ \t]*[-+*/][ \t]*[0-9]+   { printf("id assign id op inum\n"); }
p[ \t]+[a-z]                            { printf("print id\n"); }
[ \t\n]+                                ;  // Ignorar espacios en blanco y saltos de línea
.                                       { printf("Unknown token: %s\n", yytext); }

%%
int main(int argc, char **argv) {
    if (argc > 1) {
        FILE *file = fopen(argv[1], "r");
        if (!file) {
            perror("Error opening file");
            return 1;
        }
        yyin = file;
    }
    yylex();
    return 0;
}

