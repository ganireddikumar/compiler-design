%{
	#include<stdio.h>
	void yyerror(char *s);
	extern int yylex(void);
%}
%token NUM
%% 
P:
P E '\n' {printf("%d\n",$2);}
|
;
E:
E '+' T  {$$=$1+$3;}
| E '-' T   {$$=$1-$3;}
| T         {$$=$1;}
T:
| T '*' F   {$$=$1*$3;}
| T '/' F   {$$=$1/$3;}
|F          {$$=$1;}
F:
| '('E')'    {$$=$2;}
| NUM        {$$=$1;}
%%
void yyerror(char *s)
{
printf("%s",s);
}
int main()
{
yyparse();
return 0;
}
