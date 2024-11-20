import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

public class SistemaFichajes {
    private HashSet<Fichaje>Fichajes;
    private HashSet<Club>Equipos;
    private HashSet<Manager>Managers;
    private Controlador control;

    public SistemaFichajes(String nombreBase, List<String>tablas) {
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
    }
    public void iniciarManagersYJugadores(){
        HashMap<String,HashSet<Persona>>listado=control.instanciarManagersJugadores(this.Equipos);
        for(Persona m:listado.get("Managers")){
            Managers.add((Manager) m);
        }
    }
    public void iniciarFichajes(){
        this.Fichajes=control.instanciarFichajes(this.Equipos);
    }
    public HashSet<Jugador>mejoresPagos(){
        HashSet<Jugador>mejoresPagos=new HashSet<>();
       for(Posiciones posc:Posiciones.values()){
           Jugador mejorPagado=new Jugador();
           for(Club club:Equipos){
               for(Jugador J:club.ListadoPorPosicion().get(posc)){
                   if(J.getSalario()>mejorPagado.getSalario()){
                       mejorPagado=J;
                   }
               }
           }
           mejoresPagos.add(mejorPagado);
       }
        return mejoresPagos;
    }
    public void conectar(String user,String password){
        control.conectar(user, password);
    }
    public HashSet<Fichaje>maxCapSobrepasada(){
        HashSet<Fichaje>fichajesPasadosCap=new HashSet<>();
        for(Fichaje f:Fichajes){
            if(f.getEquipoFichado().ListadoPorPosicion().get(f.getJugadorFichado().getPosicion()).size()>f.getJugadorFichado().getPosicion().getCapMax()){
                fichajesPasadosCap.add(f);
            }
        }
        return fichajesPasadosCap;
    }
    public Club menorcantidadManagers(){
        Club menorCantMan=new Club();
        int contMin=0;
        for(Club club:Equipos){
            int cont=0;
            for(Manager man:club.getRelacionManagers().keySet()){
                if(club.getRelacionManagers().get(man).equals(TipoRelacion.PROHIBIDA)){
                    cont++;
                }
            }
            if(cont<contMin){
                contMin=cont;
                menorCantMan=club;
            }
        }
        return menorCantMan;
    }
    public void modFichajes(){
        for (Club club:Equipos){
            int cont=0;
            HashSet<Fichaje>rechazados=new HashSet<>();
            for (Fichaje f:Fichajes){
                if(f.getEquipoFichado().equals(club) && f.getEstado().equals(EstadoFichaje.RECHAZADO)){
                    cont++;
                    rechazados.add(f);
                }
            }
            if(cont>3){
                control.modFichajes(rechazados);
            }
        }
    }
}
