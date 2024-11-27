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
        for(Jugador player:Jugadores){
            int cont=0;
            int soloUno=0;
            Jugador remover=new Jugador();
            boolean encontrado=false;
            for(Jugador jugador:mejoresPagos){
                if(player.getPosicion().equals(jugador.getPosicion())){
                    if(player.getSalario()>jugador.getSalario()){
                        encontrado=true;
                        remover=jugador;
                    }
                } else if (player.getPosicion()!=jugador.getPosicion()) {
                    cont++;
                }
            }
            if(cont==mejoresPagos.size()){
                mejoresPagos.add(player);
            }
            if(encontrado){
                mejoresPagos.add(player);
            }
            mejoresPagos.remove(remover);
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
                if (f.getEquipoFichado().ListadoPorPosicion().get(f.getJugadorFichado().getPosicion()).size() >= f.getJugadorFichado().getPosicion().getCapMax()) {
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
    public HashSet<Manager>masDeDos(){
        HashSet<Manager>masDeDosJugadores=new HashSet<>();
        for(Manager man:Managers){
            HashSet<Club>registrados=new HashSet<>();
            for(Jugador player:man.getJugadorRepresentados()){
                if(!registrados.contains(player.getClubPerteneciente())){
                    registrados.add(player.getClubPerteneciente());
                }else{
                    masDeDosJugadores.add(man);
                }
            }
        }
        return masDeDosJugadores;
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
