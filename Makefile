all:
	flex lex_analaizer.l
	gcc lex.yy.c -o lex_analaizer

