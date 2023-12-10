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

SUM = \+
DECREASE = \- 
FLOAT_DIVISION = \/\/
INT_DIVISION = \/
ELEVATE = \*\*
PRODUCT = \*
MODULE = \~
   

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

