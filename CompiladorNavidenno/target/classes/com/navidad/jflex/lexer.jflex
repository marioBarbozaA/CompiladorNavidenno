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
    