# Source directory
SRC=./src

# Variables for the lexer
LEXER=flex
LEXER_INFILE=$(SRC)/lex.l
LEXER_OUTFILE=lex_output.c
LEXER_OPTS=-d -o $(LEXER_OUTFILE)

# Variables for the parser
PARSER=yacc
PARSER_INFILE=$(SRC)/grammar.y
PARSER_OUTFILE=parser_output.c
PARSER_OPTS=-d -o $(PARSER_OUTFILE)

# Variables for the compiler
COMPILER=gcc
COMPILER_INFILES=$(PARSER_OUTFILE) $(LEXER_OUTFILE)
COMPILER_OUTFILE=compiler
COMPILER_OPTS=-o $(COMPILER_OUTFILE) 




all: compile

compile: $(LEXER_OUTFILE) $(PARSER_OUTFILE)
	$(COMPILER) $(COMPILER_OPTS) $(COMPILER_INFILES)

$(LEXER_OUTFILE): $(LEXER_INFILE)
	$(LEXER) $(LEXER_OPTS) $(LEXER_INFILE)

$(PARSER_OUTFILE): $(PARSER_INFILE)
	$(PARSER) $(PARSER_OPTS) $(PARSER_INFILE)

clean:
	rm -f $(COMPILER_INFILES) $(COMPILER_OUTFILE)
