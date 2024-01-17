package com.navidad;

public class FabricarFuncion {
    private String nombre;
    private tipoPrimario tipado;
    private boolean retorna;
    private tipoPrimario[] tiposParametros;

    public FabricarFuncion(String nombre, tipoPrimario tipado, boolean retorna, tipoPrimario[] tiposParametros) {
        this.nombre = nombre;
        this.tipado = tipado;
        this.retorna = retorna;
        this.tiposParametros = tiposParametros;
    }

    public String getNombre() {
        return nombre;
    }

    public tipoPrimario getTipado() {
        return tipado;
    }

    public boolean isRetorna() {
        return retorna;
    }

    public tipoPrimario[] getTiposParametros() {
        return tiposParametros;
    }


    public void addTipoParametro(tipoPrimario tipo) {
        tipoPrimario[] newTiposParametros = new tipoPrimario[tiposParametros.length + 1];
        for (int i = 0; i < tiposParametros.length; i++) {
            newTiposParametros[i] = tiposParametros[i];
        }
        newTiposParametros[tiposParametros.length] = tipo;
        tiposParametros = newTiposParametros;
    }
    
    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public void setTipado(tipoPrimario tipado) {
        this.tipado = tipado;
    }

    public void setRetorna(boolean retorna) {
        this.retorna = retorna;
    }

    public void setTiposParametros(tipoPrimario[] tiposParametros) {
        this.tiposParametros = tiposParametros;
    }

    @Override
    public String toString() {
        return "FabricarFuncion{" + "nombre=" + nombre + ", tipado=" + tipado + ", retorna=" + retorna + ", tiposParametros=" + tiposParametros + '}';
    }
    



}
    
    

