import java.util.HashSet;

public class SistemaFichajes {
    private HashSet<Fichaje>Fichajes;

    public SistemaFichajes(HashSet<Fichaje> fichajes) {
        Fichajes = fichajes;
    }

    public SistemaFichajes() {
    }

    public HashSet<Fichaje> getFichajes() {
        return Fichajes;
    }

    public void setFichajes(HashSet<Fichaje> fichajes) {
        Fichajes = fichajes;
    }
    public void agregarFichaje(Fichaje nuevo){
        Fichajes.add(nuevo);
    }
}
