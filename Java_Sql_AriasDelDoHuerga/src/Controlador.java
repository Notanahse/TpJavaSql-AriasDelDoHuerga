import java.time.LocalDate;
import java.sql.Date;
import java.time.LocalDateTime;
import java.util.*;

public class Controlador {
    private AccesoBaseDeDatos acc;
    private HashSet<Manager>managers;
    private HashSet<Jugador>jugadores;

    public Controlador(String nombreBase, List<String>tablas) {
        AccesoBaseDeDatos acc;
        this.acc = acc=new AccesoBaseDeDatos(nombreBase,tablas);
        managers=new HashSet<>();
    }

    public void conectar(String user,String password){
        acc.conectar(user, password);
    }
    public HashSet<Club>listadoClubes(){
        HashMap<Integer,HashMap<String,Object>>resultadosLista=new HashMap<>();
        HashSet<Club>listado=new HashSet<>();
        ArrayList<String>columnas=new ArrayList<>();
        resultadosLista=acc.Lista("equipofutbol");
        for (HashMap<String,Object>columna:resultadosLista.values()){
                Club club =new Club((Integer) columna.get("idEquipoFutbol"),(String) columna.get("Nombre"));
                listado.add(club);
        }
        return listado;
    }
    public LocalDate fecha(Object objFecha){
       return  ((Date)objFecha).toLocalDate();
    }
    public LocalDateTime fechaTiempo(Object objFecha){
        return ((LocalDateTime) objFecha);
    }
    public HashMap<String,HashSet<Persona>> instanciarManagersJugadores(HashSet<Club> clubes){
        HashMap<String,HashSet<Persona>> instaciados=new HashMap<>();
        HashSet<Persona>listadoManagers=new HashSet<>();
        HashSet<Persona>listadoJugadores=new HashSet<>();
        HashMap<Integer,HashMap<String,Object>>resultadoLista=new HashMap<>();
        resultadoLista=acc.Lista("persona");
        for(HashMap<String,Object>columna:resultadoLista.values()){
                if(((Integer)columna.get("Manager")) ==1){
                    int id= acc.obtenerId("managers","idPersona",columna.get("idPersona"));
                    LocalDate fecha=fecha(columna.get("FechaNacimiento"));
                   Manager manager= new Manager(id,(String) columna.get("Nombre"),(String) columna.get("Apellido"),(Integer) columna.get("DNI"),fecha);
                   listadoManagers.add(manager);
                    HashMap<Integer,HashMap<String,Object>>especifico=new HashMap<>();
                    especifico=acc.ListaEspecifica("relacion","Managers_idManagers",Integer.toString(id));
                    for(HashMap<String,Object>coloEspecifica:especifico.values()){
                        for(Club c:clubes){
                            if(c.getIdClub()==(Integer)coloEspecifica.get("EquipoFutbol_idEquipoFutbol")){
                                if((((String)coloEspecifica. get("Relacion")).toUpperCase()).equals(TipoRelacion.ASOCIADOS.name())){
                                    c.agregarManager(manager,TipoRelacion.ASOCIADOS);
                                }else if((((String)coloEspecifica.get("Relacion")).toUpperCase()).equals(TipoRelacion.PROHIBIDA.name())){
                                    c.agregarManager(manager,TipoRelacion.PROHIBIDA);
                                }
                            }
                        }
                    }
                } else if ((Integer) columna.get("Manager")==0) {
                    HashMap<String,Object>valoresRestantes=acc.selectValores("jugadores","Representante,Salario","idPersona2",columna.get("idPersona"));
                    Manager representante=new Manager();
                    for (Persona mana: listadoManagers){
                        Object getidPer=acc.obtenerDatoEspecifico("persona","DNI","idPersona",mana.getDNI());
                        int idManager =(Integer) acc.obtenerDatoEspecifico("managers","IdPersona","idManagers",getidPer);
                        if(idManager==(Integer) valoresRestantes.get("Representante")){
                            representante=(Manager) mana;
                        }
                    }
                    if(valoresRestantes.get("Representante")!=null && valoresRestantes.get("Salario")!=null){
                    Jugador jogador=new Jugador((String) columna.get("Nombre"),(String)columna.get("Apellido"),(Integer) columna.get("DNI"),representante,(Integer) valoresRestantes.get("Salario"),fecha(columna.get("FechaNacimiento")));
                    Object getidPer=acc.obtenerDatoEspecifico("jugadores","idPersona2","IdJugadores",columna.get("idPersona"));
                    int clubID=(Integer) acc.obtenerDatoEspecifico("plantilla","idJugador","idEquipoFutbol",getidPer);
                    for(Club club:clubes){
                        if(club.getIdClub()==clubID){
                            club.agregarJugador(jogador);
                        }
                    }
                    Object idJug=acc.obtenerDatoEspecifico("jugadores","idPersona2","IdJugadores",columna.get("idPersona"));
                    Object ident=acc.obtenerDatoEspecifico("plantilla","idJugador","Posiciones_idPosiciones",idJug);
                    if((Integer) ident!=0) {
                        String posc = (String) acc.obtenerDatoEspecifico("posiciones", "idPosiciones", "Descripcion", ident);
                        if (posc.toUpperCase().equals(Posiciones.DELANTERO.name())) {
                            jogador.setPosicion(Posiciones.DELANTERO);
                        } else if (posc.toUpperCase().equals(Posiciones.MEDIOCAMPO.name())) {
                            jogador.setPosicion(Posiciones.MEDIOCAMPO);
                        } else if (posc.toUpperCase().equals(Posiciones.DEFENSA)) {
                            jogador.setPosicion(Posiciones.DEFENSA);
                        } else if (posc.toUpperCase().equals(Posiciones.ARQUERO.name())) {
                            jogador.setPosicion(Posiciones.ARQUERO);
                        }
                        listadoJugadores.add(jogador);
                    }
                 }
                }
                }
        instaciados.put("Managers",listadoManagers);
        instaciados.put("Jugadores",listadoJugadores);
        return instaciados;
        }
        public HashSet<Fichaje> instanciarFichajes(HashSet<Club>clubes){
            HashSet<Fichaje>fichajes=new HashSet<>();
            HashMap<Integer,HashMap<String,Object>>resultadosLista=new HashMap<>();
            resultadosLista=acc.Lista("fichaje");
            for(HashMap<String,Object>columna:resultadosLista.values()){
                Object idPer=acc.obtenerDatoEspecifico("jugadores","IdJugadores","idPersona2",columna.get("IdJugadores"));
                int dni=(Integer) acc.obtenerDatoEspecifico("persona","idPersona","DNI",idPer);
                Jugador j=new Jugador();
                for(Club c:clubes){
                    for (Jugador w:c.getPlantilla()){
                        if(w.getDNI()==dni){
                            j=w;
                        }
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
                Fichaje f=new Fichaje((Integer)columna.get("idFichaje"),j,b,fechaTiempo(columna.get("FechaFichaje")),n);
                fichajes.add(f);
            }
            return fichajes;
        }
        public Posiciones cambio(Posiciones posc){
        int randomNum=0;
        if (posc.equals(Posiciones.DELANTERO)){
            randomNum=(int)(Math.random()*3);
            switch (randomNum){
                case 0:
                    posc=Posiciones.DEFENSA;
                    break;
                case 1:
                    posc=Posiciones.MEDIOCAMPO;
                    break;
                case 2:
                    posc=Posiciones.ARQUERO;
                    break;
            }
        } else if (posc.equals(Posiciones.MEDIOCAMPO)) {
            randomNum=(int)(Math.random()*3);
            switch (randomNum){
                case 0:
                    posc=Posiciones.DEFENSA;
                    break;
                case 1:
                    posc=Posiciones.DELANTERO;
                    break;
                case 2:
                    posc=Posiciones.ARQUERO;
                    break;
            }
        } else if (posc.equals(Posiciones.DEFENSA)) {
            randomNum=(int)(Math.random()*3);
            switch (randomNum){
                case 0:
                    posc=Posiciones.DELANTERO;
                    break;
                case 1:
                    posc=Posiciones.MEDIOCAMPO;
                    break;
                case 2:
                    posc=Posiciones.ARQUERO;
                    break;
            }
        }else if(posc.equals(Posiciones.ARQUERO)){
            randomNum=(int)(Math.random()*3);
            switch (randomNum){
                case 0:
                    posc=Posiciones.DEFENSA;
                    break;
                case 1:
                    posc=Posiciones.MEDIOCAMPO;
                    break;
                case 2:
                    posc=Posiciones.DELANTERO;
                    break;
            }
        }
        return posc;
        }

    public HashSet<Manager> ListadoManagersAceptados(Club clubsolicitado) {
        HashSet<Manager>listado=new HashSet<>();
        for(Manager man:clubsolicitado.getRelacionManagers().keySet()){
            if(clubsolicitado.getRelacionManagers().get(man).equals(TipoRelacion.ASOCIADOS)){
            listado.add(man);
            }
        }
        return listado;
    }

    public void modFichajes(HashSet<Fichaje>rechazados){
        for (Fichaje f:rechazados){
            int caso=validacion(f);
            while(caso>0){
            switch (caso){
                case 1:
                    f.getJugadorFichado().setPosicion(cambio(f.getJugadorFichado().getPosicion()));
                    caso=validacion(f);
                break;
                case 2:
                    HashSet<Manager>listados=ListadoManagersAceptados(f.getEquipoFichado());
                    for (Manager mana:listados){
                        if(caso!=0){
                            f.getJugadorFichado().setRepresentante(mana);
                        }
                        caso=validacion(f);
                      }
                    }
                break;
            }
            }
        }
    public int validacion(Fichaje fich){
        int caso=0;
        if(fich.getEquipoFichado().ListadoPorPosicion().get(fich.getJugadorFichado().getPosicion()).size()>fich.getJugadorFichado().getPosicion().getCapMax()){
            caso=1;
        } else if (fich.getEquipoFichado().getRelacionManagers().get(fich.getJugadorFichado().getRepresentante()).equals(TipoRelacion.PROHIBIDA)) {
            caso=2;
        }
        return caso;
    }

    }

