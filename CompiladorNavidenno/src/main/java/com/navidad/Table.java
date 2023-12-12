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
        htmlTable.append("table { border-collapse: collapse; width: 100%; }");
        htmlTable.append("td, th { border: 1px solid black; text-align: center; padding: 8px; }");
        htmlTable.append("</style></head><body>\n<table>\n");
    
        // Encabezados de la tabla (opcional)
        if (!rows.isEmpty() && rows.get(0).length > 0) {
            htmlTable.append("<tr>\n");
            for (String header : rows.get(0)) {
                htmlTable.append("<th>").append(header).append("</th>\n");
            }
            htmlTable.append("</tr>\n");
        }
    
        // Filas de la tabla
        for (int i = 1; i < rows.size(); i++) { // Comienza en 1 si la primera fila son encabezados
            htmlTable.append("<tr>\n");
            for (String cell : rows.get(i)) {
                htmlTable.append("<td>").append(cell).append("</td>\n");
            }
            htmlTable.append("</tr>\n");
        }
    
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
