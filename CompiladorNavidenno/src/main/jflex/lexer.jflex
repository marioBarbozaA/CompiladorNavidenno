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
FLOAT_DIVISION = \/
INT_DIVISION = \/\/
ELEVATE = \*\*
PRODUCT = \*
MODULE = \~
   
//Expresiones unarias

DECREMENT = \-\-
INCREMENT = \+\+

//Expresiones relacionales
EQUAL = \=\=\=
NOT_EQUAL = \!\=\=
GREATER = \>
LESS = \<
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
ASSIGNTMENT = \<\= // e.g: a <= 10 
PIPE_DELIMITER = \| // a <= 10 |

//Expresiones de terminacion de linea
END_LINE = [\r] | (\r\n|\r|\n) | [\n]
//Expresiones de espacios en vacíos
EMPTY_SPACE = [ \t]* | {END_LINE}

//Expresiones de comentarios
LINE_COMMENT = "@" ^{END_LINE}* {END_LINE}? // e.g: @ This is a comment
MULTI_lINE_COMMENT = "\/_" [^\_] "\_/" | "\/_" "\_" + "/" // e.g: /_ This is a comment _/
FULL_COMMENT = {LINE_COMMENT} | {MULTI_lINE_COMMENT} // e.g: @ This is a comment or /_ This is a comment _/

//Expresiones de Números e identificadores
DIGIT = [0-9]
INT_NUMBER = 0 | -?[1-9]{DIGIT}*

LETTER = [a-zA-Z]
PERSONA = {LETTER}[{LETTER}{DIGIT}]*
FLOATING_NUMBER = {INT_NUMBER}*\.{DIGIT}+ // e.g: 1.0e-10

    
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

