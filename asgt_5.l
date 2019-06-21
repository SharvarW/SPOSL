%{
	#include "y.tab.h"
	extern int yylval;
%}

%%
"int" {return (Int);}
"float" {return (Float);}
"double" {return (Double);}
"char" {return (Char);}
"{" {return (COpen);}
"}" {return (CClose);}
"[" {return (Open_br);}
"]" {return (Close_br);}
";" {return (Semi);}
"=" {return (Equal);}
[0-9]+.[0-9]+ {return (dbl);}
[a-z|A-Z]+[a-z|A-Z|0-9]* {yylval=yytext[0]; return Id;}
[0-9]+ {yylval=atof(yytext); return Num;}
%%

/*
OUTPUT : 
sharvari@sharvari-Vostro-15-3568:~/Downloads$ lex asgt_8.l
sharvari@sharvari-Vostro-15-3568:~/Downloads$ yacc -d asgt_8.y
sharvari@sharvari-Vostro-15-3568:~/Downloads$ cc lex.yy.c y.tab.c -ll -ly
sharvari@sharvari-Vostro-15-3568:~/Downloads$ ./a.out text.txt

File content is : 
int a=10;
 
Acceptedsharvari@sharvari-Vostro-15-3568:~/Downloads$ 

*/


