/* JFlex example: partial Java language lexer specification */
    package com.navidad;
    import java_cup.runtime.*;

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
    NUMBER = {DIGIT}+

    LETTER = [a-zA-Z]
    PERSONA = [:jletter:] [:jletterdigit:]*

    
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
    /*
    {NUMBER} { return new Symbol(sym.NUMBER, new Integer(yytext())); }
    {LETTER} { return new Symbol(sym.LETTER, new String(yytext()));
    {ID} { return new Symbol(sym.ID, new String(yytext())); }
    . { System.err.println("Illegal character: "+yytext()); }
    \n { return new Symbol(sym.EOL); }
    <<EOF>> { return new Symbol(sym.EOF); }
    */