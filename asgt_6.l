%{
	#include "y.tab.h"
	extern int yylval;
%}

%%
"for" {return (For);}
"(" {return (Open_br);}
")" {return (Close_br);}
"{" {return (Open_curly);}
"}" {return (Close_curly);}
";" {return (Semi);}
"=" {return (Equal);}
"<"|">"|"<="|">=" {return (Rel);}
"++"|"--" {return (inc_dec);}
[a-z|A-Z] {yylval=yytext[0]; return Id;}
[0-9]+ {yylval=atof(yytext); return Num;}
%%

/*
OUTPUT : 
sharvari@sharvari-Vostro-15-3568:~/Downloads$ lex asgt_9.l
sharvari@sharvari-Vostro-15-3568:~/Downloads$ yacc -d asgt_9.y
sharvari@sharvari-Vostro-15-3568:~/Downloads$ cc lex.yy.c y.tab.c -ll -ly
sharvari@sharvari-Vostro-15-3568:~/Downloads$ ./a.out text.txt

File content is : 
for(i=0;i<n;i++){}

Accepted

*/
