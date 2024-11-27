import java.time.LocalDate;
import java.util.HashMap;
import java.util.HashSet;

public class Manager extends Persona {
    private int id;
    private HashMap<Club,TipoRelacion>clubesRelacionados;
    private HashSet<Jugador>jugadorRepresentados;
    public Manager(int id, String nombre, String apellido, int DNI, LocalDate nacimiento) {
        super(nombre, apellido, DNI,nacimiento);
        this.id=id;
        jugadorRepresentados=new HashSet<>();
        clubesRelacionados = new HashMap<>();
    }

    public Manager() {
        jugadorRepresentados=new HashSet<>();
        clubesRelacionados = new HashMap<>();
    }

    public HashSet<Jugador> getJugadorRepresentados() {
        return jugadorRepresentados;
    }

    public void setJugadorRepresentados(HashSet<Jugador> jugadorRepresentados) {
        this.jugadorRepresentados = jugadorRepresentados;
    }

    public HashMap<Club,TipoRelacion> getClubesRelacionados() {
        return clubesRelacionados;
    }

    public void setClubesRelacionados(HashMap<Club,TipoRelacion> clubesRelacionados) {
        this.clubesRelacionados = clubesRelacionados;
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
