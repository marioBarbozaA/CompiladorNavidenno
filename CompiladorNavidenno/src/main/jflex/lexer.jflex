/* JFlex example: partial Java language lexer specification */
package com.navidad;
import java_cup.runtime.*;
import java.util.ArrayList;
import java.util.List;

%%

%class Lexer
%unicode
%cup
%line
%column

//Inicio de las expresiones regulares

//Expresiones binarias
SUM = \+
DECREASE = \- 
FLOAT_DIVISION = \/\/
INT_DIVISION = \/
ELEVATE = \*\*
PRODUCT = \*
MODULE = \~
   
//Expresiones unarias
// REVISAR ESTAS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
NEGATIVE = \-
POSITIVE = \+

//Expresiones relacionales
EQUAL = \=\=\=
NOT_EQUAL = \!\=\=
GREATER = \>
LESS = \<
// HAY QUE REVISAR ESTAS !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
GREATER_EQUAL = \=\=\>
LESS_EQUAL = \=\=\<

//Expresiones logicas

DISJUNCTION = \#
COJUNCTION = \^
NOT = \!

// Expresion de control de bloques
OPEN_PARENTHESIS = \(
CLOSE_PARENTHESIS = \)
OPEN_BRACKET = \[
CLOSE_BRACKET = \]
OPEN_BRACE = \{
CLOSE_BRACE = \}
ASSIGNTMENT = \<\=
PIPE_DELIMITER = \|

//Expresiones de comentarios

DIGIT = [0-9]
NUMBER = {DIGIT}

LETTER = [a-zA-Z]
PERSONA = [a-zA-Z][a-zA-Z0-9]*

    
%%

<YYINITIAL> {
    
{SUM} { return new Symbol(sym.RODOLFO, yytext()); }
{DECREASE} { return new Symbol(sym.TRUENO, yytext()); }
{FLOAT_DIVISION} { return new Symbol(sym.RELAMPAGO, yytext()); }
{INT_DIVISION} { return new Symbol(sym.RAYO, yytext()); }
{ELEVATE} { return new Symbol(sym.SALTARIN, yytext()); }
{PRODUCT} { return new Symbol(sym.COMETA, yytext()); }
{MODULE} { return new Symbol(sym.CUPIDO, yytext()); }
    
}
// Fallback

