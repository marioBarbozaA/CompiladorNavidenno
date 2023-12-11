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
FLOATING_NUMBER = {INT_NUMBER}*\.{DIGIT}+ // e.g: 1.0e-10
IDENTIFIER = {LETTER}[{LETTER}{DIGIT}]*

    
%%


//Palabras reservadas
INT = "int"
FLOAT = "float"
STRING = "string"
BOOL = "bool"
CHAR = "char"
ARR = "arr"
TRUE = "true"
FALSE = "false"
IF = "if"
ELSE = "else"
ELIF = "elif"
WHILE = "while"
FOR = "for"
DO = "do"
UNTIL = "until"
RETURN = "return"
BREAK = "break"
CONTINUE = "continue"
PASS = "pass"
PRINT = "print"
READ = "read"
MAIN = "main"
VOID = "void"
NULL = "null"
IN = "in"

<YYINITIAL> { INT } { return new Symbol(sym.COLACHO_INT, INT); }
<YYINITIAL> { FLOAT } { return new Symbol(sym.JOULUPUKKI_FLOAT, FLOAT); }
<YYINITIAL> { STRING } { return new Symbol(sym.SANTA_STRING, STRING); }
<YYINITIAL> { BOOL } { return new Symbol(sym.PAPA_NOEL_BOOLEAN, BOOL); }
<YYINITIAL> { CHAR } { return new Symbol(sym.CLAUS_CHAR, CHAR); }
<YYINITIAL> { ARR } { return new Symbol(sym.VIEJITO_PASCUERO_ARRAY, ARR); }
<YYINITIAL> { TRUE } { return new Symbol(sym.L_VIEJITO_PASCUERO, TRUE); }
<YYINITIAL> { FALSE } { return new Symbol(sym.L_JOULUPUKKI, FALSE); }
<YYINITIAL> { IF } { return new Symbol(sym.ELFO_IF, IF); }
<YYINITIAL> { ELSE } { return new Symbol(sym.DUENDE_ELSE, ELSE); }
<YYINITIAL> { ELIF } { return new Symbol(sym.HADA_ELIF, ELIF); }
<YYINITIAL> { FOR } { return new Symbol(sym.ENVUELVE_FOR, FOR); }
<YYINITIAL> { DO } { return new Symbol(sym.HACE_DO, DO); }
<YYINITIAL> { UNTIL } { return new Symbol(sym.REVISA_UNTIL, UNTIL); }
<YYINITIAL> { RETURN } { return new Symbol(sym.ENVIA_RETURN, RETURN); }
<YYINITIAL> { BREAK } { return new Symbol(sym.CORTA_BREAK, BREAK); }
<YYINITIAL> { PRINT } { return new Symbol(sym.NARRA_PRINT, PRINT); }
<YYINITIAL> { READ } { return new Symbol(sym.ESCUCHA_READ, READ); }
<YYINITIAL> { MAIN } { return new Symbol(sym.ESTRELLA_MAIN, MAIN); }


<YYINITIAL> {
//Operaciones de control de bloques
{OPEN_PARENTHESIS} { return new Symbol(sym.ABRE_CUENTO, yytext()); }
{CLOSE_PARENTHESIS} { return new Symbol(sym.CIERRE_CUENTO, yytext()); }
{OPEN_BRACKET} { return new Symbol(sym.ABRE_EMPAQUE, yytext()); }
{CLOSE_BRACKET} { return new Symbol(sym.CIERRA_EMPAQUE, yytext()); }
{OPEN_BRACE} { return new Symbol(sym.ABRE_REGALO, yytext()); }
{CLOSE_BRACE} { return new Symbol(sym.CIERRA_REGALO, yytext()); }
{ASSIGNTMENT} { return new Symbol(sym.ENTREGA, yytext()); }
{PIPE_DELIMITER} { return new Symbol(sym.FIN_REGALO, yytext()); }

//Operaciones unarias
{DECREMENT} { return new Symbol(sym.GRINCH_DECREMENT, yytext()); }
{INCREMENT} { return new Symbol(sym.QUIEN_INCREMENT, yytext()); }

//Operacones binarias
{SUM} { return new Symbol(sym.RODOLFO_SUM, yytext()); }
{DECREASE} { return new Symbol(sym.TRUENO_DECREASE, yytext()); }
{FLOAT_DIVISION} { return new Symbol(sym.RAYO_FLOAT_DIVISION, yytext()); }
{INT_DIVISION} { return new Symbol(sym.RELAMPAGO_INT_DIVISION, yytext()); }
{ELEVATE} { return new Symbol(sym.SALTARIN_ELEVATE, yytext()); }
{PRODUCT} { return new Symbol(sym.COMETA_PRODUCT, yytext()); }
{MODULE} { return new Symbol(sym.CUPIDO_MODULE, yytext()); }

//Operaciones de comparacion
{EQUAL} { return new Symbol(sym.ELFO_EQUAL, yytext()); }
{NOT_EQUAL} { return new Symbol(sym.ELFO_NOT_EQUAL, yytext()); }
{GREATER} { return new Symbol(sym.ELFO_GREATER, yytext()); }
{LESS} { return new Symbol(sym.ELFO_LESS, yytext()); }
{GREATER_EQUAL} { return new Symbol(sym.ELFO_GREATER_EQUAL, yytext()); }
{LESS_EQUAL} { return new Symbol(sym.ELFO_LESS_EQUAL, yytext()); }

//Operaciones logicas
{DISJUNCTION} { return new Symbol(sym.REY_GASPAR_DISJUNCTION, yytext()); }
{COJUNCTION} { return new Symbol(sym.REY_MELCHOR_COJUNCTION, yytext()); }
{NOT} { return new Symbol(sym.REY_BALTASAR_NOT, yytext()); }



// IDENTIFICADOR
{IDENTIFIER} { return new Symbol(sym.PERSONA, yytext()); }


}
// Fallback

// COLACHO_INT a <= 10|