package com.navidad;

public class SymbolObject {
    private String Entrada; // Entrada main, fucntion etc...
    private String Tipo; // Tipo de datos de la entrada
    private String ID; // ID

    public String getID() {
        return ID;
    }

    public String getTipo() {
        return Tipo;
    }

    public String getEntrada() {
        return Entrada;
    }

    public SymbolObject(String Entrada, String Tipo, String ID) {
        this.Entrada = Entrada;
        this.Tipo = Tipo;
        this.ID = ID;
    }

    public String toString() {
        return String.format("%s\t%s\t%s", Entrada, Tipo, ID);
    }
}
