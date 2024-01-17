package com.navidad;

public class FabricarExpresion {
    private Object valor;
    private tipoPrimario tipado;
    private String direccionASM;

    public FabricarExpresion(Object valor, tipoPrimario tipado) {
        this.valor = valor;
        this.tipado = tipado;
    }

    public FabricarExpresion(Object valor, tipoPrimario tipado, String direccionASM) {
        this.valor = valor;
        this.tipado = tipado;
        this.direccionASM = direccionASM;
    }

    public Object getValor() {
        return valor;
    }

    public tipoPrimario getTipado() {
        return tipado;
    }

    public String getDireccionASM() {
        return direccionASM;
    }

    public void setValor(Object valor) {
        this.valor = valor;
    }

    public void setTipado(tipoPrimario tipado) {
        this.tipado = tipado;
    }

    public void setDireccionASM(String direccionASM) {
        this.direccionASM = direccionASM;
    }

    /**
     * Convierte el tipo de la expresión a su versión de arreglo, si es posible.
     */
    public void convertirTipadoAArreglo() {
        this.tipado = HerramientasFabrica.toArr(this.tipado);
    }

    /**
     * Convierte el tipo de la expresión de arreglo a su tipo básico, si es posible.
     */
    public void convertirArregloATipo() {
        this.tipado = HerramientasFabrica.fromArr(this.tipado);
    }

    @Override
    public String toString() {
        return "FabricarExpresion{" +
                "valor=" + valor +
                ", tipado=" + tipado +
                ", direccionASM='" + direccionASM + '\'' +
                '}';
    }
}
