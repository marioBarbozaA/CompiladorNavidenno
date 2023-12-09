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
    ID = {LETTER}({LETTER}|{DIGIT})*


    %%


    {SUM} { return new Symbol(sym.SUM); }
    {DECREASE} { return new Symbol(sym.DECREASE); }
    {FLOAT_DIVISION} { return new Symbol(sym.FLOAT_DIVISION); }
    {INT_DIVISION} { return new Symbol(sym.INT_DIVISION); }
    {ELEVATE} { return new Symbol(sym.ELEVATE); }
    {PRODUCT} { return new Symbol(sym.PRODUCT); }
    {MODULE} { return new Symbol(sym.MODULE); }
    {NUMBER} { return new Symbol(sym.NUMBER, new Integer(yytext())); }
    {LETTER} { return new Symbol(sym.LETTER, new String(yytext()));
    {ID} { return new Symbol(sym.ID, new String(yytext())); }
    . { System.err.println("Illegal character: "+yytext()); }
    \n { return new Symbol(sym.EOL); }
    <<EOF>> { return new Symbol(sym.EOF); }
