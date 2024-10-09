import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

public class Main {
    public static void main(String[] args) {

        List<String> tablas = Arrays.asList("EquipoFutbol", "Fichaje", "Jugadores", "Managers", "Plantilla",
                "Persona", "Posiciones", "Relacion");

        AccesoBaseDeDatos bdd = new AccesoBaseDeDatos("Polipases", tablas);
        bdd.conectar("alumno","alumnoipm");

    }
}
