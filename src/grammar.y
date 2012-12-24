%{
    #include <stdio.h>
    #include <stdbool.h>

    main() {
        yyparse();
    }
%}

/* Possible types of parse tokens   */
%union {
    char    *string;
    int     boolean;
    int     integer;
}

%token <string>     IDENTIFIER
%token <integer>    INT_CONST
%token <boolean>    BOOL_CONST
%token <string>     STRING_CONST
%token IF THEN LET BE IS A THE
%token INT_TYPE BOOL_TYPE STRING_TYPE

%%

statement   : assignment_stmt
            ;

assignment_stmt : LET IDENTIFIER BE A identifier_type { $5 $2; }
                ;
identifier_type : INT_TYPE  { $$ = "int" }
                | STRING_TYPE { $$ = "char*" }
                ;
