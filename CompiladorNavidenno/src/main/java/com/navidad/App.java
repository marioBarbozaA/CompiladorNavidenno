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
        List<String[]> list = new ArrayList<String[]>();    
        // El posicionamiento será Lexema - Token - Codigo - Linea - Columna
        table.addRow(new String[] {"Lexema", "Token", "Codigo de Token", "Linea", "Columna"});
        try {
            Reader reader = new BufferedReader(new FileReader(Mydocument));
            Lexer lexer = new Lexer(reader);
            while (true) {
                String[] newRow = new String[5];
                Symbol symbol = lexer.next_token();
                if (symbol.sym == 0) {
                    break;
                }
                newRow[0] = symbol.value.toString();
                newRow[1] = sym.terminalNames[symbol.sym];
                newRow[2] = Integer.toString(symbol.sym);
                newRow[3] = Integer.toString(symbol.left);
                newRow[4] = Integer.toString(symbol.right);
                table.addRow(newRow);
                System.out.println("Token: " + symbol.sym + " " + sym.terminalNames[symbol.sym] + " " + symbol.value);
            }
            table.writeHtmlTableToFile(".\\src\\test\\java\\com\\navidad\\Carta_a_Santa.html");
            

        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("Hello World!");

         
    }
}
