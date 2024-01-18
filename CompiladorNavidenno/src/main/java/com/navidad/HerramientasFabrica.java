package com.navidad;

import java.util.HashMap;
import java.util.Map;

public class HerramientasFabrica {

    private static final Map<tipoPrimario, tipoPrimario> toArrMap = new HashMap<>();
    private static final Map<tipoPrimario, tipoPrimario> fromArrMap = new HashMap<>();
    private static final Map<String, tipoPrimario> tipoFromStringMap = new HashMap<>();

    static {
        // Inicialización de toArrMap
        toArrMap.put(tipoPrimario.INT, tipoPrimario.INT_ARR);
        toArrMap.put(tipoPrimario.CHAR, tipoPrimario.CHAR_ARR);

        // Inicialización de fromArrMap
        fromArrMap.put(tipoPrimario.INT_ARR, tipoPrimario.INT);
        fromArrMap.put(tipoPrimario.CHAR_ARR, tipoPrimario.CHAR);

        // Inicialización de tipoFromStringMap
        tipoFromStringMap.put("int", tipoPrimario.INT);
        tipoFromStringMap.put("float", tipoPrimario.FLOAT);
        tipoFromStringMap.put("string", tipoPrimario.STRING);
        tipoFromStringMap.put("bool", tipoPrimario.BOOL);
        tipoFromStringMap.put("char", tipoPrimario.CHAR);
        tipoFromStringMap.put("char[]", tipoPrimario.CHAR_ARR);
        tipoFromStringMap.put("int[]", tipoPrimario.INT_ARR);
    }

    public static tipoPrimario tiparArray(tipoPrimario tipo) {
        return toArrMap.getOrDefault(tipo, tipoPrimario.NULL);
    }

    public static tipoPrimario destiparArray(tipoPrimario tipo){
        return fromArrMap.getOrDefault(tipo, tipoPrimario.NULL);
    }

    public static tipoPrimario clasificarTipo(String tipo) {
        return tipoFromStringMap.getOrDefault(tipo, tipoPrimario.NULL);
    }
}
