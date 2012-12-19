%{
    #include <stdio.h>
    #include "parser_output.h"

    void yyerror(char *s) {
        fprintf(stderr, "%s\n", s);
    }
%}

IDENTIFIER  [A-Za-z0-9_]+
INTEGER     [0-9]+

%option noyywrap

%%

if              return IF;
is              return IS;
then            return THEN;
let             return LET;
be              return BE;
\n              /* ignore end-of-line */;
[ \t]+          /* Ignore whitespace */;
{INTEGER}         yylval.integer = atoi(yytext); return INTEGER;
{IDENTIFIER}      yylval.string = strdup(yytext); return IDENTIFIER;
.               ECHO; printf(" unexpected\n");
%%
