package compiladores;

public class Simbolo {
    private String nombre;
    private String tipo;
    private boolean inicializado;

    public Simbolo(String nombre, String tipo) {
        this.nombre = nombre;
        this.tipo = tipo;
        this.inicializado = false;
    }

    public String getNombre() {
        return nombre;
    }

    public String getTipo() {
        return tipo;
    }

    public boolean isInicializado() {
        return inicializado;
    }

    public void setInicializado(boolean inicializado) {
        this.inicializado = inicializado;
    }

    @Override
    public String toString() {
        return nombre + " : " + tipo + (inicializado ? " (inicializado)" : " (no inicializado)");
    }
}