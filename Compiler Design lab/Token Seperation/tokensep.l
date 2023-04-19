%option noyywrap
%{
	#include<stdio.h>
%}
letter [a-zA-Z]
digit [0-9]
op  [-+*/]
paran [(){}]
ws [\t\n" "]
sc [=,;]
%%
int|float|else|main  {printf("%s is a keyword\n",yytext);}
{digit}+             {printf("%s is a number\n",yytext);}
{letter}({letter}|{digit})*  {printf("%s is a identifier\n",yytext);}
{op}                 {printf("%s is an operator\n",yytext);}
{paran}+              {printf("%s is an paranthesis\n",yytext);}
{ws}+                 {printf("Whitespace\n",yytext);}
{sc}                  {printf("%s is an Special Character\n",yytext);}
.printf("error");
%%
int main(int argc,char *argv[])
{
    FILE *fp;
          fp=yyin;
	  yyin=fopen(argv[1],"r");
	  yylex();
	  return 0;
}
