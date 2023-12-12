package com.navidad;
import java_cup.runtime.*;
import java.io.*;
import java.util.*;
/**
 * Hello world!
 *
 */

public class App {
    public static void main(String[] args) {
        String Mydocument = ".\\src\\test\\java\\com\\navidad\\Carta_a_Santa.txt";
        try {
            Reader reader = new BufferedReader(new FileReader(Mydocument));
            Lexer lexer = new Lexer(reader);
            System.out.println("Tokens: ");

            while (true) {
                Symbol symbol = lexer.next_token();
                if (symbol.sym == 0) {
                    break;
                }
                System.out.println("Token: " + symbol.sym + " " + symbol.value);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        System.out.println("Hello World!");

         
    }
}
