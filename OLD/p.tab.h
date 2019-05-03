/* A Bison parser, made by GNU Bison 2.4.2.  */

/* Skeleton interface for Bison's Yacc-like parsers in C
   
      Copyright (C) 1984, 1989-1990, 2000-2006, 2009-2010 Free Software
   Foundation, Inc.
   
   This program is free software: you can redistribute it and/or modify
   it under the terms of the GNU General Public License as published by
   the Free Software Foundation, either version 3 of the License, or
   (at your option) any later version.
   
   This program is distributed in the hope that it will be useful,
   but WITHOUT ANY WARRANTY; without even the implied warranty of
   MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
   GNU General Public License for more details.
   
   You should have received a copy of the GNU General Public License
   along with this program.  If not, see <http://www.gnu.org/licenses/>.  */

/* As a special exception, you may create a larger work that contains
   part or all of the Bison parser skeleton and distribute that work
   under terms of your choice, so long as that work isn't itself a
   parser generator using the skeleton or a modified version thereof
   as a parser skeleton.  Alternatively, if you modify or redistribute
   the parser skeleton itself, you may (at your option) remove this
   special exception, which will cause the skeleton and the resulting
   Bison output files to be licensed under the GNU General Public
   License without this special exception.
   
   This special exception was added by the Free Software Foundation in
   version 2.2 of Bison.  */


/* Tokens.  */
#ifndef YYTOKENTYPE
# define YYTOKENTYPE
   /* Put the tokens into the symbol table, so that GDB and other debuggers
      know about them.  */
   enum yytokentype {
     OPAFFECT = 258,
     OUVRIR = 259,
     FERMER = 260,
     POINT = 261,
     VIRGULE = 262,
     POINTVIRGULE = 263,
     DEUXPOINTS = 264,
     VAR = 265,
     BEGINS = 266,
     END = 267,
     PROGRAM = 268,
     DO = 269,
     WHILE = 270,
     IF = 271,
     THEN = 272,
     ELSE = 273,
     NOT = 274,
     OPADD = 275,
     OPMUL = 276,
     OPREL = 277,
     INTEGER = 278,
     INTNO = 279,
     ID = 280
   };
#endif



#if ! defined YYSTYPE && ! defined YYSTYPE_IS_DECLARED
typedef union 
/* Line 1685 of yacc.c  */
#line 6 "p.y"
semrec
{

/* Line 1685 of yacc.c  */
#line 6 "p.y"

   int integer;
   char *id;
   char *string;
   char charval;
 


/* Line 1685 of yacc.c  */
#line 88 "p.tab.h"
} YYSTYPE;
# define YYSTYPE_IS_TRIVIAL 1
# define yystype YYSTYPE /* obsolescent; will be withdrawn */
# define YYSTYPE_IS_DECLARED 1
#endif

extern YYSTYPE yylval;

