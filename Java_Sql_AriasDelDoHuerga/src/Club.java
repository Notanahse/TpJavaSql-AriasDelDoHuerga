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

    public Club() {
    }

    public HashMap<Manager, TipoRelacion> getRelacionManagers() {
        return relacionManagers;
    }

    public void setRelacionManagers(HashMap<Manager, TipoRelacion> relacionManagers) {
        this.relacionManagers = relacionManagers;
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

    public HashMap<Posiciones,HashSet<Jugador>>ListadoPorPosicion(){
        HashMap<Posiciones,HashSet<Jugador>>Listado=new HashMap<>();
        HashSet<Jugador>Delanteros=new HashSet<>();
        HashSet<Jugador>Mediocampistas=new HashSet<>();
        HashSet<Jugador>Defensas=new HashSet<>();
        HashSet<Jugador>Arqueros=new HashSet<>();
        for(Jugador j:Plantilla){
            if(j.getPosicion().equals(Posiciones.DELANTERO)){
                Delanteros.add(j);
            } else if (j.getPosicion().equals(Posiciones.MEDIOCAMPO)) {
                Mediocampistas.add(j);
            } else if (j.getPosicion().equals(Posiciones.DEFENSA)) {
                Defensas.add(j);
            } else if (j.getPosicion().equals(Posiciones.ARQUERO)) {
                Arqueros.add(j);
            }
        }
        Listado.put(Posiciones.DELANTERO,Delanteros);
        Listado.put(Posiciones.MEDIOCAMPO,Mediocampistas);
        Listado.put(Posiciones.DEFENSA,Defensas);
        Listado.put(Posiciones.ARQUERO,Arqueros);
        return Listado;
    }
    public HashSet<Manager>managersNoCorrespondientes(){
        HashSet<Manager>noCorrespondientes=new HashSet<>();
        for(Jugador j:Plantilla){
            if(relacionManagers.get(j.getRepresentante()).equals(TipoRelacion.PROHIBIDA)){
                noCorrespondientes.add(j.getRepresentante());
            }
        }
        return noCorrespondientes;
    }

    public HashSet<Jugador> getPlantilla() {
        return Plantilla;
    }

    public void setPlantilla(HashSet<Jugador> plantilla) {
        Plantilla = plantilla;
    }

    public HashSet<Manager>masDeDosJugadores(){
        HashSet<Manager>managers=new HashSet<>();
        for(Manager m:relacionManagers.keySet()){
            int cont=0;
            if(relacionManagers.get(m).equals(TipoRelacion.ASOCIADOS)){
                for(Jugador j:Plantilla){
                    if(j.getRepresentante().equals(m)){
                        cont++;
                    }
                }
            }
            if(cont>1){
                managers.add(m);
            }
        }
        return managers;
    }
}
