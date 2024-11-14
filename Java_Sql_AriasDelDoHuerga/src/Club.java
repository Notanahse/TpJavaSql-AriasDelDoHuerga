import java.util.HashMap;
import java.util.HashSet;

public class Club {
    private int idClub;
    private String nombre;
    private HashMap<Manager,TipoRelacion>relacionManagers;
    private HashSet<Jugador>Plantilla;

    public Club(int id,String nombre) {
        idClub=id;
        this.nombre=nombre;
        relacionManagers=new HashMap<>();
        Plantilla=new HashSet<>();
    }

    public int getIdClub() {
        return idClub;
    }

    public void setIdClub(int idClub) {
        this.idClub = idClub;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public void agregarJugador(Jugador jugador){
        if(!Plantilla.contains(jugador)){
            this.Plantilla.add(jugador);
        }
    }
    public void agregarManager(Manager man, TipoRelacion tipo){
        this.relacionManagers.put(man,tipo);
    }
}
