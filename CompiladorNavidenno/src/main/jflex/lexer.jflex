/* JFlex example: partial Java language lexer specification */
package com.navidad;
import java_cup.runtime.*;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;


%%

%class Lexer
%unicode
%cup
%line
%column

%{
    StringBuffer string = new StringBuffer();


    private Symbol symbol(int type) {
        return new Symbol(type, yyline, yycolumn);
    }
    //Debo de utilizar a este metodo para poder obtener el valor de los tokens
    private Symbol symbol(int type, Object value) {
        return new Symbol(type, yyline, yycolumn, value);
    }

    public List<Symbol> getTokens() {
        List<Symbol> tokens = new ArrayList<Symbol>();
        Symbol token;
        try {
            while ((token = next_token()).sym != sym.EOF) {
                if (token.sym == sym.MEDIAS_ERROR) {
                    Symbol error = symbol(token.sym, token.value);
                    System.err.println(sym.terminalNames[error.sym]+ " "   + error.value + " en la linea " + error.left + " y columna " + error.right);
                } else {
                    tokens.add(symbol(token.sym, token.value));
                }

            }
        } catch (IOException e) {
            System.err.println("Error: " + e.getMessage());
        }
        return tokens;
    }
%}
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
END_LINE = \r\n|\r|\n
//Expresiones de espacios en vacíos
EMPTY_SPACE = [ \t]* | {END_LINE}

//Expresiones de comentarios
LINE_COMMENT = "@" .* {END_LINE}? // e.g: @ This is a comment
MULTI_lINE_COMMENT = "/_" [^_]* "_/" // e.g: /_ This is a comment _/
FULL_COMMENT = {LINE_COMMENT} | {MULTI_lINE_COMMENT} // e.g: @ This is a comment or /_ This is a comment _/

//Expresiones de Números e identificadores
DIGIT = [0-9]
INT_NUMBER = 0 | -?[1-9]{DIGIT}*

LETTER = [a-zA-Z]
FLOATING_NUMBER = {INT_NUMBER}\.{DIGIT}+ // e.g: 1.0e-10
IDENTIFIER = {LETTER}[{LETTER}{DIGIT}]*
CHAR_L = \'.\'

%state STRING

%%


//Palabras reservadas
//No se pueden definiir como constartes, hay que ponerlo como una cadena de texto
<YYINITIAL>  "function"  { return new Symbol(sym.FUNCTION_VILLANCICOS, "function"); }
<YYINITIAL>  "local"  { return new Symbol(sym.LOCAL_MUERDAGO, "local"); }
<YYINITIAL>  "int"  { return new Symbol(sym.COLACHO_INT, "int"); }
<YYINITIAL>  "float"  { return new Symbol(sym.JOULUPUKKI_FLOAT, "float"); }
<YYINITIAL>  "string"  { return new Symbol(sym.SANTA_STRING, "string"); }
<YYINITIAL>  "bool"  { return new Symbol(sym.PAPA_NOEL_BOOLEAN, "bool"); }
<YYINITIAL>  "char"  { return new Symbol(sym.CLAUS_CHAR, "char"); }
<YYINITIAL>  "arr"  { return new Symbol(sym.VIEJITO_PASCUERO_ARRAY, "arr"); }
<YYINITIAL>  "true"  { return new Symbol(sym.PAPA_NOEL_TRUE, "true"); }
<YYINITIAL>  "false"  { return new Symbol(sym.PAPA_NOEL_FALSE, "false"); }
<YYINITIAL>  "if"  { return new Symbol(sym.ELFO_IF, "if"); }
<YYINITIAL>  "else"  { return new Symbol(sym.DUENDE_ELSE, "else"); }
<YYINITIAL>  "elif"  { return new Symbol(sym.HADA_ELIF, "elif"); }
<YYINITIAL>  "for"  { return new Symbol(sym.ENVUELVE_FOR, "for"); }
<YYINITIAL>  "do"  { return new Symbol(sym.HACE_DO, "do"); }
<YYINITIAL>  "until"  { return new Symbol(sym.REVISA_UNTIL, "until"); }
<YYINITIAL>  "return"  { return new Symbol(sym.ENVIA_RETURN, "return"); }
<YYINITIAL>  "break"  { return new Symbol(sym.CORTA_BREAK, "break"); }
<YYINITIAL>  "print"  { return new Symbol(sym.NARRA_PRINT, "print"); }
<YYINITIAL>  "read" { return new Symbol(sym.ESCUCHA_READ, "read"); }
<YYINITIAL>  "main"  { return new Symbol(sym.ESTRELLA_MAIN, "main"); }


<YYINITIAL> {
//Espacios en blanco
{EMPTY_SPACE} { /* ignore */ }
// comentarios
{FULL_COMMENT} { /* ignore */ }
\" { string.setLength(0); yybegin(STRING); }
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

// LITERALES
{CHAR_L} { return new Symbol(sym.L_CLAUS_CHAR, yytext()); }
{FLOATING_NUMBER} { return new Symbol(sym.L_JOULUPUKKI_FLOAT, yytext()); }
{INT_NUMBER} { return new Symbol(sym.L_COLACHO_INT, yytext()); }

<STRING> {
    \" { yybegin(YYINITIAL); return symbol(sym.L_SANTA_STRING, string.toString()); }
    [^\n\r\"\\] { string.append(yytext()); }
    \\n { string.append("\n"); }
    \\r { string.append("\r"); }
    \\t { string.append("\t"); }
    \\\" { string.append("\""); }
    \\ { string.append("\\"); }
}

}
// Lexemas no reconocidos
[^] { 
    // Acción a tomar para cualquier caracter no reconocido
    return new Symbol(sym.MEDIAS_ERROR, yytext()); 
}


