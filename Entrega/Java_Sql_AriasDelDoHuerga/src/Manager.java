import java.time.LocalDate;
import java.util.HashMap;
import java.util.HashSet;

public class Manager extends Persona {
    private int id;
    private HashMap<Club,TipoRelacion>clubesRelacionados;
    private HashSet<Club>aceptados;
    private HashSet<Jugador>jugadorRepresentados;
    public Manager(int id, String nombre, String apellido, int DNI, LocalDate nacimiento) {
        super(nombre, apellido, DNI,nacimiento);
        this.id=id;
    }

    public Manager() {
    }
    public void agregarClub(Club club){
        aceptados.add(club);
    }
    public void agregarJugador(Jugador jugador){
        jugadorRepresentados.add(jugador);
    }
    public void agregarclubesRelacionados(Club club, TipoRelacion tipo){
        clubesRelacionados.put(club,tipo);
    }
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
