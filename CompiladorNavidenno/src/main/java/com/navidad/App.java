package com.navidad;
import java_cup.runtime.*;
import java.io.*;

/**
 * Clase principal de la aplicación.
 * Esta clase procesa un archivo de texto para generar una tabla HTML con los tokens analizados.
 */
public class App {
    // Rutas de los archivos de entrada y salida
    private static final String DOCUMENT_PATH = ".\\src\\test\\java\\com\\navidad\\Carta_a_Santa.txt";
    private static final String OUTPUT_PATH = ".\\src\\test\\java\\com\\navidad\\Carta_a_Santa.html";

    /**
     * Método principal que inicia el proceso de análisis del archivo y generación de la tabla.
     * @param args Argumentos de la línea de comandos (no utilizados).
     */
    public static void main(String[] args) {
        Table table = initializeTable();
        processFile(DOCUMENT_PATH, table);
        exportTableToFile(table, OUTPUT_PATH);
        System.out.println("Proceso completado.");
    }
    

    /**
     * Inicializa la tabla con los encabezados correspondientes.
     * @return Una instancia de Table con los encabezados configurados.
     */
    private static Table initializeTable() {
        Table table = new Table();
        table.addRow(new String[]{"Lexema", "Token", "Codigo de Token", "Linea", "Columna"});
        return table;
    }

    /**
     * Procesa el archivo de texto, analizando los tokens y agregándolos a la tabla.
     * @param filePath Ruta del archivo de texto a procesar.
     * @param table Tabla donde se agregan los tokens.
     */
    private static void processFile(String filePath, Table table) {
        try (Reader reader = new BufferedReader(new FileReader(filePath))) {
            Reader readerPar = new BufferedReader(new FileReader(filePath));
            Lexer lexer = new Lexer(reader);
            Lexer lexPar = new Lexer(readerPar);
            parser parse = new parser(lexPar);
            parse.parse();
            for (Symbol token : lexer.getTokens()) {
                addTokenToTable(token, table);
                System.out.println("Token: " + token.sym + " " + sym.terminalNames[token.sym] + " " + token.value);
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    /**
     * Agrega un token a la tabla.
     * @param token Token a agregar.
     * @param table Tabla donde se agrega el token.
     */
    private static void addTokenToTable(Symbol token, Table table) {
        table.addRow(new String[]{
            token.value.toString(),
            sym.terminalNames[token.sym],
            Integer.toString(token.sym),
            Integer.toString(token.left + 1),
            Integer.toString(token.right + 1)
        });
    }

    /**
     * Exporta la tabla a un archivo HTML.
     * @param table Tabla a exportar.
     * @param outputPath Ruta del archivo HTML de salida.
     */
    private static void exportTableToFile(Table table, String outputPath) {
        table.writeHtmlTableToFile(outputPath);
    }
}
