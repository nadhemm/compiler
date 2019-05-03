%{
#include <string.h>
//#include "p.tab.h"
#include "parser.h"
%}
%%
[+\-]                           {yylval.charval = yytext[0];return OPADD ; }
[*/]|"and"|"or"|"mod"|"div"     {yylval.charval = yytext[0];return OPMUL ; }
"="                            {return OPAFFECT ; }
"<"|">"                         {return OPREL ; }
"<>"|"<="|">="|"=="			        {yylval.string = strdup(yytext);return OPREL ; }
\(                              {return OUVRIR ; }
\)                              {return FERMER ; }
[0-9]+							{yylval.integer = atoi(yytext);return INTNO;}
\.                              {return POINT ; }
\,                              {return VIRGULE ; }
\;                              {return POINTVIRGULE ; }
\:                              {return DEUXPOINTS  ; }
"program"                       {return PROGRAM ; }
"func"                      	{return FUNC ; }
"proc"                     	{return PROC ; }
"var"                           {return VAR ; }
"int"                       	{return INTEGER ; }
\{	                        {return BEGINS ; }
\}                          	{return END ; }
"do"                            {return DO ; }
"while"                         {return WHILE ; }
"if"                            {return IF ; }
"then"                          {return THEN ; }
"else"                          {return ELSE ; }
"not"                           {return NOT ; }
[a-z][a-zA-Z0-9]*               {yylval.id = (char *) strdup( yytext ); return ID ; }
[ \t]                           {/*whitespace*/}
[\n\r\0\x0B]+                   {/*end of line chars*/}
.                               {printf("Caractere special %c\n ", *yytext); }
%%
int yywrap() {return 1;}
