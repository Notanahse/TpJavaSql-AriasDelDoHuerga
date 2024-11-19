import java.time.LocalDate;
import java.util.*;

public class Controlador {
    private AccesoBaseDeDatos acc;
    private HashSet<Club>clubes;
    private HashSet<Manager>managers;
    private HashSet<Jugador>jugadores;
    private SistemaFichajes sistem;

    public Controlador(String nombreBase, List<String>tablas) {
        AccesoBaseDeDatos acc;
        this.acc = acc=new AccesoBaseDeDatos(nombreBase,tablas);
        clubes=new HashSet<>();
        managers=new HashSet<>();
    }

    public void conectar(String user,String password){
        acc.conectar(user, password);
    }
    public HashSet<Club>listadoClubes(){
        HashMap<Integer,HashMap<String,Object>>resultadosLista=new HashMap<>();
        HashSet<Club>listado=new HashSet<>();
        ArrayList<String>columnas=new ArrayList<>();
        resultadosLista=acc.Lista("EquipoFutbol");
        for (HashMap<String,Object>columna:resultadosLista.values()){
                Club c =new Club((Integer) columna.get("idEquipoFutbol"),(String) columna.get("Nombre"));
                listado.add(c);
                this.clubes.add(c);
        }
        return listado;
    }
    public LocalDate fecha(Object objFecha){
        String[] fech=((String)objFecha).split("-");
        List<String>listdate=Arrays.asList(fech);
        return LocalDate.of((Integer.parseInt(listdate.get(0))),Integer.parseInt(listdate.get(1)),Integer.parseInt(listdate.get(2)));
    }
    public HashMap<String,HashSet<Persona>> instanciarManagersJugadores(HashSet<Club> clubes){
        HashMap<String,HashSet<Persona>> instaciados=new HashMap<>();
        HashSet<Persona>listadoManagers=new HashSet<>();
        HashSet<Persona>listadoJugadores=new HashSet<>();
        HashMap<Integer,HashMap<String,Object>>resultadoLista=new HashMap<>();
        resultadoLista=acc.Lista("Persona");
        for(HashMap<String,Object>columna:resultadoLista.values()){
                if(((Integer)columna.get("Manager")) ==1){
                    int id= acc.obtenerId("Managers","idPersona",columna.get("idPersona"));
                   Manager m= new Manager(id,(String) columna.get("Nombre"),(String) columna.get("Apellid|o"),(Integer) columna.get("DNI"),fecha(columna.get("FechaNacimiento")));
                   listadoManagers.add(m);
                   /* HashMap<Integer,HashMap<String,Object>>especifico=new HashMap<>();
                    especifico=acc.ListaEspecifica("Relacion","Managers_idManagers",Integer.toString(id));
                    for(HashMap<String,Object>coloEspecifica:especifico.values()){
                        for(Club c:clubes){
                            if(c.getIdClub()==(Integer)coloEspecifica.get("EquipoFutbol_idEquipoFutbol")){
                                if((((String)coloEspecifica. get("Relacion")).toUpperCase()).equals(TipoRelacion.ASOCIADOS.name())){
                                    c.agregarManager(m,TipoRelacion.ASOCIADOS);
                                }else if((((String)coloEspecifica.get("Relacion")).toUpperCase()).equals(TipoRelacion.PROHIBIDA.name())){
                                    c.agregarManager(m,TipoRelacion.PROHIBIDA);
                                }
                            }
                        }
                    }*/
                } else if ((Integer) columna.get("Manager")==0) {
                    HashMap<String,Object>valoresRestantes=acc.selectValores("Jugadores","Representante,Salario","idPersona2",columna.get("idPersona"));
                    Manager representante=new Manager();
                    for (Manager l:managers){
                        if(l.getId()==(Integer) valoresRestantes.get("Representante")){
                            representante=l;
                        }
                    }
                    Jugador j=new Jugador((String) columna.get("Nombre"),(String)columna.get("Apellido"),(Integer) columna.get("DNI"),representante,(Integer) valoresRestantes.get("Salario"),fecha(columna.get("FechaNacimiento")));
                    int clubID=(Integer) acc.obtenerDatoEspecifico("Plantilla","idJugador","idEquipoFutbol",columna.get("IdJugadores"));
                    for(Club b:clubes){
                        if(b.getIdClub()==clubID){
                            b.agregarJugador(j);
                        }
                    }
                    Object ident=acc.obtenerDatoEspecifico("plantilla","idJugador","Posiciones_idPosiciones",columna.get("idJugador"));
                    String posc=(String) acc.obtenerDatoEspecifico("Posicion","idPosiciones","Descripcion",ident);
                    if(posc.toUpperCase().equals(Posiciones.DELANTERO.name())){
                        j.setPosicion(Posiciones.DELANTERO);
                    } else if (posc.toUpperCase().equals(Posiciones.MEDIOCAMPO.name())) {
                        j.setPosicion(Posiciones.MEDIOCAMPO);
                    } else if (posc.toUpperCase().equals(Posiciones.DEFENSA)) {
                        j.setPosicion(Posiciones.DEFENSA);
                    } else if (posc.toUpperCase().equals(Posiciones.ARQUERO.name())) {
                        j.setPosicion(Posiciones.ARQUERO);
                    }
                 listadoJugadores.add(j);
                 }
                }
        instaciados.put("Managers",listadoManagers);
        instaciados.put("Jugadores",listadoJugadores);
        return instaciados;
        }
        public void instanciarFichajes(){
            HashMap<Integer,HashMap<String,Object>>resultadosLista=new HashMap<>();
            resultadosLista=acc.Lista("Fichaje");
            for(HashMap<String,Object>columna:resultadosLista.values()){
                Object idPer=acc.obtenerDatoEspecifico("Jugadores","IdJugadores","idPersona2",columna.get("IdJugadores"));
                int dni=(Integer) acc.obtenerDatoEspecifico("Persona","idPersona","DNI",idPer);
                Jugador j=new Jugador();
                for (Jugador w:jugadores){
                    if(w.getDNI()==dni){
                        j=w;
                    }
                }
                Club b=new Club();
                for(Club c:clubes){
                    if (c.getIdClub()==((Integer)columna.get("idEquipoFutbol"))){
                        b=c;
                    }
                }
                EstadoFichaje n=null;
                if(((String)columna.get("EstadoDelFichaje")).toUpperCase().equals(EstadoFichaje.RECHAZADO.name())){
                    n=EstadoFichaje.RECHAZADO;
                }else if(((String)columna.get("EstadoDelFichaje")).toUpperCase().equals(EstadoFichaje.CONFIRMADO.name())){
                    n=EstadoFichaje.CONFIRMADO;
                }
                Fichaje f=new Fichaje((Integer)columna.get("idFichaje"),j,b,fecha(columna.get("FechaFichaje")),n);
                sistem.agregarFichaje(f);
            }
        }

    }

