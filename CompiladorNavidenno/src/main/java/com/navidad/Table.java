package com.navidad;

import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

public class Table {
    private List<String[]> rows;

    public Table() {
        rows = new ArrayList<>();
    }

    public void addRow(String[] row) {
        rows.add(row);
    }

    private String generateHtmlTable() {
        StringBuilder htmlTable = new StringBuilder("<html><head><style>");
        
        // Importar la fuente de Google Fonts
        htmlTable.append("@import url('https://fonts.googleapis.com/css?family=Roboto:400,700');");
    
        // Estilos generales de la tabla
        htmlTable.append("table { border-collapse: separate; width: 100%; box-shadow: 0 2px 3px rgba(0,0,0,0.1);");
        htmlTable.append("font-family: 'Roboto', sans-serif; color: #333; margin: 25px 0; border-spacing: 0; }");
    
        // Estilos de cabecera de la tabla
        htmlTable.append("thead { background-color: #8A33FF; color: #FFF; }");
    
        // Estilos de las celdas de la cabecera
        htmlTable.append("th { font-weight: 700; padding: 12px 15px; text-align: left; }");
    
        // Estilos de las celdas del cuerpo de la tabla
        htmlTable.append("td { border-top: 1px solid #DDD; padding: 12px 15px; text-align: left; }");
    
        // Estilos del cuerpo de la tabla para filas alternas
        htmlTable.append("tbody tr:nth-child(odd) { background-color: #F6F6F6; }");
        htmlTable.append("tbody tr:nth-child(even) { background-color: #E9E9E9; }");
    
        htmlTable.append("</style></head><body>\n<table>\n");
    
        // Suponiendo que `rows` es una lista de arreglos de cadenas que contiene los datos de la tabla
        // Encabezados de la tabla (opcional)
        if (!rows.isEmpty() && rows.get(0).length > 0) {
            htmlTable.append("<thead><tr>\n");
            for (String header : rows.get(0)) {
                htmlTable.append("<th>").append(header).append("</th>\n");
            }
            htmlTable.append("</tr></thead>\n");
        }
        
        // Cuerpo de la tabla
        htmlTable.append("<tbody>\n");
        for (int i = 1; i < rows.size(); i++) { // Comienza en 1 si la primera fila son encabezados
            htmlTable.append("<tr>\n");
            for (String cell : rows.get(i)) {
                htmlTable.append("<td>").append(cell).append("</td>\n");
            }
            htmlTable.append("</tr>\n");
        }
        htmlTable.append("</tbody>\n");
    
        htmlTable.append("</table>\n</body></html>");
        return htmlTable.toString();
    }
    
    

    public void writeHtmlTableToFile(String filePath) {
        String htmlTable = generateHtmlTable();
        try (BufferedWriter writer = new BufferedWriter(new FileWriter(filePath))) {
            writer.write(htmlTable);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
