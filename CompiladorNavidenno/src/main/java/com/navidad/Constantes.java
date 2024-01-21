package com.navidad;

enum tipoPrimario {
    INT,
    FLOAT,
    STRING,
    BOOL,
    CHAR,
    CHAR_ARR,
    INT_ARR,
    NULL
}

public interface Constantes{
    //Aritmeticos
    public static final String S_SUMA = " + ";
    public static final String S_RESTA = " - ";
    public static final String S_MULTIPLICACION = " * ";
    public static final String S_POWER = " ** ";
    public static final String S_DIVISION_INT = " / ";
    public static final String S_DIVISION_FLOAT = " // ";
    public static final String S_MODULO = " ~ ";
    public static final String S_INCREMENTAR = " ++ ";
    public static final String S_DECREMENTAR = " -- ";

    // Logicos
    public static final String S_DISJUNCION = " # ";
    public static final String S_CONJUNCION = " ^ ";
    public static final String S_NEGACION = " ! ";

    // Relacionales
    public static final String S_MAYOR_QUE = " > ";
    public static final String S_MENOR_QUE = " < ";
    public static final String S_MAYOR_IGUAL_QUE = " ==> ";
    public static final String S_MENOR_IGUAL_QUE = " ==< ";
    public static final String S_IGUAL_QUE = " === ";
    public static final String S_DIFERENTE_QUE = " !== ";
}