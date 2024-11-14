import java.sql.SQLException;
import java.util.*;

public class Main {
    private HashMap<Club, HashSet<Jugador>>PlantillaClubes;
    private HashSet<Manager>listadoRepresentantes;
    public static void main(String[] args) {

        List<String> tablas = Arrays.asList("EquipoFutbol", "Fichaje", "Jugadores", "Managers", "Plantilla",
                "Persona", "Posiciones", "Relacion");

        Controlador bdd = new Controlador("Polipases", tablas);
        bdd.conectar("alumno","alumnoipm");
        bdd.listadoClubes();
        bdd.InstanciarJugadores();

    }
}
