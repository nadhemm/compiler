%{
#include <stdio.h>
int yylex();
int yyerror(char *s);
%}
%union semrec{
   int integer;
   char *id;
   char *string;
   char charval;
 }
%start  program
%token ELSE
%token IF
%token THEN
%token WHILE
%token DO
%token PROC
%token FUNC
%token OPAFFECT
%token OUVRIR 
%token FERMER 
%token POINT 
%token VIRGULE
%token POINTVIRGULE
%token DEUXPOINTS
%token VAR
%token BEGINS
%token END
%token PROGRAM
%token NOT
%token <charval> OPADD 
%token <charval> OPMUL
%token <string> OPREL
%token <int> INTEGER
%token <int> INTNO
%token <id> ID 
%type <string> declaration_sous_programme 
%type <string> identifier_list 
%type <charval> entete_sous_programmes 
%type <charval> arguments 
%type <charval> liste_parametres 
%type <charval> type 
%type <charval> factor 
%type <charval> statement 
%type <charval> expression 
%type <charval> simple_expression 
%type <charval> term 
%type <charval> expression_list 
%%
program: 
 PROGRAM ID {
 printf("nom programme: %s\n", $2);
 }
 declarations{
 }
 declaration_sous_programmes
 compound_statement
 POINT
 {
printf("\n\n### FIN DU PROGRAMME ###\n");
}
;
 identifier_list:
ID {printf ("%s", $1);}
|identifier_list VIRGULE ID {printf("%s", $3);}
;
declarations:
declarations VAR identifier_list DEUXPOINTS type 
{ 
} POINTVIRGULE
  {}
  |{}
  ;
  type:
  INTEGER {printf(" : %s\n", "int");}
  ;
  declaration_sous_programmes:
  declaration_sous_programmes
  declaration_sous_programme
  {}POINTVIRGULE
  {}
  |{}
  ;
  declaration_sous_programme:
  entete_sous_programmes{}
  |declarations{}
  |compound_statement{}
  ;
  entete_sous_programmes:
  FUNC ID arguments DEUXPOINTS type {}
  | PROC ID arguments DEUXPOINTS type {}
  ;
  arguments:
  OUVRIR liste_parametres FERMER {}
  | {}
  ;
  liste_parametres:
  identifier_list DEUXPOINTS type {}
  |liste_parametres POINTVIRGULE identifier_list DEUXPOINTS type {}
  ;
  compound_statement:
  BEGINS 
  optional_statements
  END
  {printf("compound statement\n");}
  ;
  optional_statements:
  statement_list {printf("reducing optional_statements: statement_list\n");}
  |{printf("reducing optional statements EMPTY rule\n");}
  ;
  statement_list:
  statement {printf("reducing statement_list: statement\n");}
  |statement_list POINTVIRGULE statement {printf("reducing statement_list: statement_list POINTVIRGULE statement\n");}
  ;
  statement:
  variable OPAFFECT expression {printf("reducing statement: ID OPAFFECT expression\n");
}
|instruc_proc {printf("reducing statement: procedure_statement\n");}
|compound_statement {printf("reducing statement: compound_statement\n");}
|IF expression THEN
 statement
 ELSE
 statement
{
  printf( "###End IF...THEN...ELSE###\n");
}|WHILE expression DO statement {printf("reducing statement: WHILE...DO\n");}
;
variable:
ID
;
instruc_proc:
ID
|ID OUVRIR expression_list FERMER
;
expression_list:
expression {printf("reducing expression_list: expression\n");}
|expression_list VIRGULE expression {printf("reducing expression_list: expression_list VIRGULE expression\n");}
;
expression:
simple_expression {printf("reducing expression simple_expression\n");}
|simple_expression OPREL simple_expression {
  $$='i';printf("reducing expression: simple_expression OPREL simple_expression\n");
  if(strcmp($2, "<")==0){
    printf( "slt\t$t0, $t0, $t1\t#is it less than?\n");
  }
  else if(strcmp($2, ">")==0){
    printf( "sgt \t$t0, $t0, $t1\t#is it less than?\n");
  }
  else if(strcmp($2, "<=")==0){
    printf( "sle\t$t0, $t0, $t1\t#is it less than or equal?\n");
  }
  else if(strcmp($2, ">=")==0){
    printf( "sge\t$t0, $t0, $t1\t#is it greater than or equal?\n");
  }
}
;
simple_expression:
term {printf("reducing simple_expression term\n");}
|sign term {printf("reducing simple_expression sign term\n");}
|simple_expression OPADD term {if($1 == 'r' || $3 == 'r')$$ = 'r'; else $$='i'; printf("reducing simple_expression: simple_expression OPADD term\n");
printf("\n\n### ADDITION ###\n");
switch($2){
  case '+':
  printf( "add\t$t0, $t1, $t0\t#add\n");
  break;
  case'-':
  printf( "sub\t$t0, $t1, $t0\t#add\n");
  break;
  default:
  printf("#Wrong OPADD Operation\n");
  break;
}
}
;
term:
factor {printf("reducing term: factor\n");}
|term OPMUL factor {if($1 == 'r' || $3 == 'r')$$ = 'r'; else $$='i';printf("reducing term: term OPMUL factor\n");
printf("\n\n### MULTIPLICATION ###\n");
switch($2){
  case '*':
  printf( "mul\t$t0, $t1, $t0\t#multiply\n");
  break;
  case '/':
  printf( "div\t$t0, $t1, $t0\t#divide\n");
  break;
  default:
  printf("#Wrong OPMUL Operation\n");
  break;
}
}
;
factor:
ID {printf("reducing factor: ID\n");
}
|ID OUVRIR expression_list FERMER {printf("reducing factor: ID OUVRIR expression_list FERMER\n");
}
|INTNO {$$='i';printf("reducing factor: INTNO\n");
}
|OUVRIR expression FERMER {printf("reducing factor: OUVRIR expression FERMER\n");}
|NOT factor {printf("reducing factor: NOT factor\n");}
;
sign:
OPADD {printf("reducing sign: OPADD\n");}
;
%%
int yyerror(char *s){
	printf("yyerror %s",s);
}
int main(){
	yyparse();
	return 0;
}
