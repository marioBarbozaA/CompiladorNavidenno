package com.navidad;
import java_cup.runtime.*;
import java.io.*;
import java.util.*;
/**
 * Hello world!
 * Esta se la dedico a Mario Barboza mi amor
 */

public class App {
    public static void main(String[] args) {
 
        String Mydocument = ".\\src\\test\\java\\com\\navidad\\Carta_a_Santa.txt";
        Table table = new Table();         
        // El posicionamiento será Lexema - Token - Codigo - Linea - Columna
        table.addRow(new String[] {"Lexema", "Token", "Codigo de Token", "Linea", "Columna"});
        try {
            Reader reader = new BufferedReader(new FileReader(Mydocument));
            Lexer lexer = new Lexer(reader);
            for (Symbol token : lexer.getTokens()) {
                table.addRow(new String[]{ token.value.toString(),
                    sym.terminalNames[token.sym],
                    Integer.toString(token.sym),
                    Integer.toString(token.left),
                    Integer.toString(token.right)
                });
                System.out.println("Token: " + token.sym + " " + sym.terminalNames[token.sym] + " " + token.value);
            }

            table.writeHtmlTableToFile(".\\src\\test\\java\\com\\navidad\\Carta_a_Santa.html");


        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("Hello World!");

         
    }
}
