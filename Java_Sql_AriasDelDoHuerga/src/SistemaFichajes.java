import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

public class SistemaFichajes {
    private HashSet<Fichaje>Fichajes;
    private HashSet<Club>Equipos;
    private HashSet<Manager>Managers;
    private Controlador control;

    public SistemaFichajes(HashSet<Fichaje> fichajes, String nombreBase, List<String>tablas) {
        Fichajes = fichajes;
        this.control=new Controlador(nombreBase,tablas);
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

    public void iniciarEquipos(){
        this.Equipos = control.listadoClubes();
        //RECORDATORIO AL INICIALIZAR JUGADORES O MANAGERS PONERLO DENTRO DE ESTOS LISTADOS
    }
    public void iniciarManagersYJugadores(){
        HashMap<String,HashSet<Persona>>listado=control.instanciarManagersJugadores(this.Equipos);
        for(Persona m:listado.get("Managers")){
            Managers.add((Manager) m);
        }
    }
    public void iniciarFichajes(){
 //TERMINAR DE INSTANCIAR LOS FICHAJES EN ESTA CLASE, EN LA SUYA HACER LOS CAMBIOS NECESARIOS PARA QUE LOS PASE COMO UN HASHSET DE FICHAJES Y ACA SEA SOLO NECEDARIO IGUALARLO.
    }
    public HashSet<Jugador>mejoresPagos(){
        HashSet<Jugador>mejoresPagos=new HashSet<>();
        Jugador j1=new Jugador();
        Jugador j2=new Jugador();
        Jugador j3=new Jugador();
        Jugador j4=new Jugador();
        for (Fichaje fichaje : Fichajes) {
            if(fichaje.getJugadorFichado().getPosicion().equals(Posiciones.DELANTERO)){
                if(fichaje.getJugadorFichado().getSalario()>j1.getSalario()){
                    j1=fichaje.getJugadorFichado();
                }
            } else if (fichaje.getJugadorFichado().getPosicion().equals(Posiciones.MEDIOCAMPO)) {
                if(fichaje.getJugadorFichado().getSalario()>j2.getSalario()){
                    j2=fichaje.getJugadorFichado();
                }
            } else if (fichaje.getJugadorFichado().getPosicion().equals(Posiciones.DEFENSA)) {
                if(fichaje.getJugadorFichado().getSalario()>j3.getSalario()){
                    j3=fichaje.getJugadorFichado();
                }
            } else if (fichaje.getJugadorFichado().getPosicion().equals(Posiciones.ARQUERO)) {
                if (fichaje.getJugadorFichado().getSalario()>j4.getSalario()){
                    j4=fichaje.getJugadorFichado();
                }
            }
        }
        mejoresPagos.add(j1);
        mejoresPagos.add(j2);
        mejoresPagos.add(j3);
        mejoresPagos.add(j4);
        return mejoresPagos;
    }
}
