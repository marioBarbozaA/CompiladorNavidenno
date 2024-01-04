/* JFlex example: partial Java language lexer specification */
package com.navidad;
import java_cup.runtime.*;
import java.util.ArrayList;
import java.util.List;
import java.io.IOException;


%%

%class Lexer
%public
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
                    System.out.println("Error ESTOY AQUIIIIIIIIII: PROBANDOOOOOO" );
                    System.err.println(sym.terminalNames[error.sym]+ " "   + error.value + " en la linea " + error.left + " y columna " + error.right);
                } else {
                            
                    tokens.add(symbol(token.sym, token.value));
                }

            }
        } catch (IOException e) {
            System.out.println("Error: PROBANDOOOOOO" );
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
MULTI_lINE_COMMENT = "/_"(.|\r?\n)*?"_/" // e.g: /_ This is a comment _/
FULL_COMMENT = {LINE_COMMENT} | {MULTI_lINE_COMMENT} // e.g: @ This is a comment or /_ This is a comment _/

//Expresiones de Números e identificadores
DIGIT = [0-9]
INT_NUMBER = 0|-?[1-9]{DIGIT}*

LETTER = [a-zA-Z]
FLOATING_NUMBER = {INT_NUMBER}\.{1}{DIGIT}+ // e.g: 1.0e-10
IDENTIFIER = ({LETTER}|[\_])[{LETTER}{DIGIT}]*
CHAR_L = \'.\'
SEPARATOR = \,
ERRORS = \.
%state STRING

%%


//Palabras reservadas
//No se pueden definiir como constartes, hay que ponerlo como una cadena de texto
<YYINITIAL>  "function"  { return  symbol(sym.FUNCTION_VILLANCICOS, "function"); }
<YYINITIAL>  "local"  { return  symbol(sym.LOCAL_MUERDAGO, "local"); }
<YYINITIAL>  "int"  { return  symbol(sym.COLACHO_INT, "int"); }
<YYINITIAL>  "float"  { return  symbol(sym.JOULUPUKKI_FLOAT, "float"); }
<YYINITIAL>  "string"  { return  symbol(sym.SANTA_STRING, "string"); }
<YYINITIAL>  "bool"  { return  symbol(sym.PAPA_NOEL_BOOLEAN, "bool"); }
<YYINITIAL>  "char"  { return  symbol(sym.CLAUS_CHAR, "char"); }
<YYINITIAL>  "arr"  { return  symbol(sym.VIEJITO_PASCUERO_ARRAY, "arr"); }
<YYINITIAL>  "true"  { return  symbol(sym.PAPA_NOEL_TRUE, "true"); }
<YYINITIAL>  "false"  { return  symbol(sym.PAPA_NOEL_FALSE, "false"); }
<YYINITIAL>  "if"  { return  symbol(sym.ELFO_IF, "if"); }
<YYINITIAL>  "else"  { return  symbol(sym.DUENDE_ELSE, "else"); }
<YYINITIAL>  "elif"  { return  symbol(sym.HADA_ELIF, "elif"); }
<YYINITIAL>  "for"  { return  symbol(sym.ENVUELVE_FOR, "for"); }
<YYINITIAL>  "do"  { return  symbol(sym.HACE_DO, "do"); }
<YYINITIAL>  "until"  { return  symbol(sym.REVISA_UNTIL, "until"); }
<YYINITIAL>  "return"  { return  symbol(sym.ENVIA_RETURN, "return"); }
<YYINITIAL>  "break"  { return  symbol(sym.CORTA_BREAK, "break"); }
<YYINITIAL>  "print"  { return  symbol(sym.NARRA_PRINT, "print"); }
<YYINITIAL>  "read" { return  symbol(sym.ESCUCHA_READ, "read"); }
<YYINITIAL>  "main"  { return  symbol(sym.ESTRELLA_MAIN, "main"); }


<YYINITIAL> {
//Espacios en blanco
{FULL_COMMENT} { /* ignore */ }
{EMPTY_SPACE} { /* ignore */ }
// comentarios
\" { string.setLength(0); yybegin(STRING); }
//Operaciones de control de bloques
{OPEN_PARENTHESIS} { return  symbol(sym.ABRE_CUENTO, yytext()); }
{CLOSE_PARENTHESIS} { return  symbol(sym.CIERRE_CUENTO, yytext()); }
{OPEN_BRACKET} { return  symbol(sym.ABRE_EMPAQUE, yytext()); }
{CLOSE_BRACKET} { return  symbol(sym.CIERRA_EMPAQUE, yytext()); }
{OPEN_BRACE} { return  symbol(sym.ABRE_REGALO, yytext()); }
{CLOSE_BRACE} { return  symbol(sym.CIERRA_REGALO, yytext()); }
{ASSIGNTMENT} { return  symbol(sym.ENTREGA, yytext()); }
{PIPE_DELIMITER} { return  symbol(sym.FIN_REGALO, yytext()); }

//Operaciones unarias
{DECREMENT} { return  symbol(sym.GRINCH_DECREMENT, yytext()); }
{INCREMENT} { return  symbol(sym.QUIEN_INCREMENT, yytext()); }

//Operacones binarias
{SUM} { return  symbol(sym.RODOLFO_SUM, yytext()); }
{DECREASE} { return  symbol(sym.TRUENO_DECREASE, yytext()); }
{FLOAT_DIVISION} { return  symbol(sym.RAYO_FLOAT_DIVISION, yytext()); }
{INT_DIVISION} { return  symbol(sym.RELAMPAGO_INT_DIVISION, yytext()); }
{ELEVATE} { return  symbol(sym.SALTARIN_ELEVATE, yytext()); }
{PRODUCT} { return  symbol(sym.COMETA_PRODUCT, yytext()); }
{MODULE} { return  symbol(sym.CUPIDO_MODULE, yytext()); }

//Operaciones de comparacion
{EQUAL} { return  symbol(sym.ELFO_EQUAL, yytext()); }
{NOT_EQUAL} { return  symbol(sym.ELFO_NOT_EQUAL, yytext()); }
{GREATER} { return  symbol(sym.ELFO_GREATER, yytext()); }
{LESS} { return  symbol(sym.ELFO_LESS, yytext()); }
{GREATER_EQUAL} { return  symbol(sym.ELFO_GREATER_EQUAL, yytext()); }
{LESS_EQUAL} { return  symbol(sym.ELFO_LESS_EQUAL, yytext()); }

//Operaciones logicas
{DISJUNCTION} { return  symbol(sym.REY_GASPAR_DISJUNCTION, yytext()); }
{COJUNCTION} { return  symbol(sym.REY_MELCHOR_COJUNCTION, yytext()); }
{NOT} { return  symbol(sym.REY_BALTASAR_NOT, yytext()); }



// IDENTIFICADOR
{IDENTIFIER} { return  symbol(sym.PERSONA, yytext()); }
{SEPARATOR} { return  symbol(sym.SEPARADOR_BASTON, yytext());}
{ERRORS} { return  symbol(sym.MEDIAS_ERROR, yytext()); }

// LITERALES
{CHAR_L} { return  symbol(sym.L_CLAUS_CHAR, yytext()); }
{FLOATING_NUMBER} { return  symbol(sym.L_JOULUPUKKI_FLOAT, yytext()); }
{INT_NUMBER} { return  symbol(sym.L_COLACHO_INT, yytext()); }

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
    return  symbol(sym.MEDIAS_ERROR, yytext()); 
}


