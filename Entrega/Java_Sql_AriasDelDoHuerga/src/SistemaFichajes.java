import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

public class SistemaFichajes {
    private HashSet<Fichaje>Fichajes;
    private HashSet<Club>Equipos;
    private HashSet<Manager>Managers;
    private HashSet<Jugador>Jugadores;
    private Controlador control;


    public SistemaFichajes(String nombreBase, List<String>tablas) {
        this.control=new Controlador(nombreBase,tablas);
        Managers=new HashSet<>();
        Jugadores=new HashSet<>();
    }

    public SistemaFichajes() {
    }

    public HashSet<Club> getEquipos() {
        return Equipos;
    }

    public void setEquipos(HashSet<Club> equipos) {
        Equipos = equipos;
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
        for(Persona m:listado.get("Jugadores")){
            Jugadores.add((Jugador) m);
        }
    }
    public void iniciarFichajes(){
        this.Fichajes=control.instanciarFichajes(this.Equipos,this.Jugadores);
    }
    public HashSet<Jugador>mejoresPagos(){
        HashSet<Jugador>mejoresPagos=new HashSet<>();
       for(Posiciones posc:Posiciones.values()){
           Jugador mejorPagado=new Jugador();
           for(Club equipo:Equipos){
               if(equipo.ListadoPorPosicion()!=null && equipo.ListadoPorPosicion().get(posc)!=null){
               for(Jugador J:equipo.ListadoPorPosicion().get(posc)){
                   if(J.getSalario()>mejorPagado.getSalario()){
                       mejorPagado=J;
                   }
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

    public HashSet<Jugador>maxCapSobrepasada(){
        HashSet<Jugador>fichajesPasadosCap=new HashSet<>();
        for(Fichaje f:Fichajes) {
            if (f.getEquipoFichado().ListadoPorPosicion() != null && f.getEquipoFichado().ListadoPorPosicion().get(f.getJugadorFichado().getPosicion())!=null) {
                if (f.getEquipoFichado().ListadoPorPosicion().get(f.getJugadorFichado().getPosicion()).size() > f.getJugadorFichado().getPosicion().getCapMax()) {
                    f.setEstado(EstadoFichaje.RECHAZADO);
                    fichajesPasadosCap.add(f.getJugadorFichado());

                }
            }
        }
        return fichajesPasadosCap;
    }
    public Club menorcantidadManagers(){
        Club menorCantMan=new Club();
        int contMin=10000;
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
    public Jugador fichajeMasJoven(){
        Jugador masJoven=new Jugador();
        for(Fichaje fich:Fichajes){
            if(fich.getEstado().equals(EstadoFichaje.CONFIRMADO)) {
                if ((fich.getJugadorFichado().getNacimiento().isBefore(masJoven.getNacimiento()))) {
                    masJoven = fich.getJugadorFichado();
                }
            }
        }
        return masJoven;
    }
    public HashMap<Club,HashSet<Manager>>masDeDos(){
        HashMap<Club,HashSet<Manager>> masDeDos=new HashMap<>();
        HashSet<Manager>listado=new HashSet<>();
        for(Club club:Equipos){
            listado=club.masDeDosJugadores();
            masDeDos.put(club,listado);
        }
        return masDeDos;
    }
    public HashSet<Jugador>jugadoresNoCorrespondientes(){
        HashSet<Jugador>noCorrespondientes=new HashSet<>();
        for(Club club:Equipos){
            HashSet<Jugador>listadoNo=club.managersNoCorrespondientes();
            for (Jugador player:listadoNo){
                noCorrespondientes.add(player);
            }
        }
        return noCorrespondientes;
    }

    public Controlador getControl() {
        return control;
    }

    public void setControl(Controlador control) {
        this.control = control;
    }

    public HashSet<Jugador> getJugadores() {
        return Jugadores;
    }

    public void setJugadores(HashSet<Jugador> jugadores) {
        Jugadores = jugadores;
    }

    public HashSet<Manager> getManagers() {
        return Managers;
    }

    public void setManagers(HashSet<Manager> managers) {
        Managers = managers;
    }
}
