%{
	#include<stdio.h>
	FILE *f;
	int num=0,small_char=0,capital_char=0,space=0,spl_char=0,words=0,lines=0,sent=0;
%}

Character [a-zA-Z]
Number [0-9]
Space " "
SpecialCharater ","|"+"|"-"|"("|")"
Line "\n"
Sentence "."|"?"|"!"
%%

{Character} small_char++;
{Number} num++;
{Space} {space++,words++;}
{SpecialCharater} spl_char++;
{Line} {lines++,words++;}
{Sentence} {spl_char++,sent++;}

%%

int main(int argc,char *argv[])
{
	f=fopen(argv[1],"r");
	yyin=f;
	yylex();
	printf("\nCharacters : %d",small_char);
	printf("\nNumbers : %d",num);
	printf("\nWords : %d",words);
	printf("\nLines : %d",lines);
	printf("\nSpaces : %d" ,space);
	printf("\nSpecial Character : %d" ,spl_char);
	printf("\nSentences : %d" ,sent);
	printf("\n");
	return 0;
}
/*
OUTPUT : 
sharvari@sharvari-Vostro-15-3568:~/Desktop/SPOSL/Assignment_4$ ^C
sharvari@sharvari-Vostro-15-3568:~/Desktop/SPOSL/Assignment_4$ lex asgt_4.l
sharvari@sharvari-Vostro-15-3568:~/Desktop/SPOSL/Assignment_4$ gcc lex.yy.c -ll
sharvari@sharvari-Vostro-15-3568:~/Desktop/SPOSL/Assignment_4$ ./a.out text.txt

Characters : 29
Numbers : 0
Words : 9
Lines : 3
Spaces : 6
Special Character : 4
Sentences : 2
sharvari@sharvari-Vostro-15-3568:~/Desktop/SPOSL/Assignment_4$ 
*/

