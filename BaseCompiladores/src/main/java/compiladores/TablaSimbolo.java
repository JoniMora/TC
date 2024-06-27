package compiladores;

import java.util.HashMap;
import java.util.Map;

// Gestrionar simbolos.java
public class TablaSimbolo {
    private Map<String, Simbolo> tabla;

    public TablaSimbolo() {
        this.tabla = new HashMap<>();
    }

    public boolean agregarSimbolo(String nombre, String tipo) {
        if (tabla.containsKey(nombre)) {
            return false;
        }
        tabla.put(nombre, new Simbolo(nombre, tipo));
        return true;
    }

    public Simbolo obtenerSimbolo(String nombre) {
        return tabla.get(nombre);
    }

    public void inicializarSimbolo(String nombre) {
        Simbolo simbolo = tabla.get(nombre);
        if (simbolo != null) {
            simbolo.setInicializado(true);
        }
    }

    public void usarSimbolo(String nombre) {
        Simbolo simbolo = tabla.get(nombre);
        if (simbolo != null) {
            simbolo.setUsado(true);
        }
    }

    public void reporteErrores() {
        for (Simbolo simbolo : tabla.values()) {
            if (!simbolo.isUsado()) {
                System.out.println("Advertencia: El símbolo '" + simbolo.getNombre() + "' fue declarado pero no usado.");
            }
            if (!simbolo.isInicializado()) {
                System.out.println("Advertencia: El símbolo '" + simbolo.getNombre() + "' fue declarado pero no inicializado.");
            }
        }
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        for (Simbolo simbolo : tabla.values()) {
            sb.append(simbolo).append("\n");
        }
        return sb.toString();
    }
}
