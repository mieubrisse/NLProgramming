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
%token <integer>    INTEGER
%token <boolean>    BOOLEAN
%token IF THEN LET BE IS

%%

statement   : assignment_stmt
            ;

assignment_stmt : LET IDENTIFIER BE INTEGER { printf("Letting %s be %i\n", $2, $4); }
                ;




