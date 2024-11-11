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

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
    public void agregarManager(Manager man){
        /*this.relacionManagers.put(man,)*/
        //AGREGAR EN CONTROLADOR UNA PARTE QUE NOS DEJE SABER LA RELACION CON EL MANAGER DEPENDIENDO DEL CLUB
    }
}
