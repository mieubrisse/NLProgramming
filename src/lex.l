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
a|an            return A;
the             return THE;
\n              /* ignore end-of-line */;
[ \t]+          /* Ignore whitespace */;
{INTEGER}       yylval.integer = atoi(yytext); return INT_CONST;
true|false      yylval.boolean = !strcmp("true"); return BOOL_CONST;
\".*\"          yylval.string = strdup(yytext); return STRING_CONST;
{IDENTIFIER}    yylval.string = strdup(yytext); return IDENTIFIER;
.               ECHO; printf(" unexpected\n");
%%
