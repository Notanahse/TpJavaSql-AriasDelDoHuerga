import java.sql.SQLException;
import java.util.*;
import java.util.stream.Collectors;

public class Main {
    public static void main(String[] args) {

        List<String> tablas = Arrays.asList("EquipoFutbol", "Fichaje", "Jugadores", "Managers", "Plantilla",
                "Persona", "Posiciones", "Relacion");

        SistemaFichajes sis=new SistemaFichajes("Polipases",tablas);
        sis.conectar("root","roo7pa$w0rd"); //mi casa:"root" "bAcK_7oM3Y$" notebook: "root" "roo7pa$w0rd"
        sis.iniciarEquipos();
        sis.iniciarManagersYJugadores();
        sis.iniciarFichajes();


        HashSet<Club>clubes=new HashSet<>();
        clubes=sis.getEquipos();
        System.out.println("DEMOSTRACION PUNTO 3A");
        ArrayList<Club>equipos=(ArrayList<Club>) clubes.stream().collect(Collectors.toList());
        HashMap<Posiciones,HashSet<Jugador>>listadoPerPoscicion=equipos.get(0).ListadoPorPosicion();
        for(Posiciones p:listadoPerPoscicion.keySet()){
            System.out.println("Posicion: "+ p.name() +" Cantidad Jugadores: "+listadoPerPoscicion.get(p).size());
        }

        System.out.println("DEMOSTRACION PUNTO 3B");
        Jugador masJoven=new Jugador();
        masJoven=sis.fichajeMasJoven();
        System.out.println(masJoven.getNombre()+" "+masJoven.getApellido()+", "+ ((masJoven.getNacimiento()).getYear()) + " de edad");

        System.out.println("DEMOSTRACION PUNTO 3C");
        HashSet<Jugador>sobrePasanCapacidad;
        sobrePasanCapacidad=sis.maxCapSobrepasada();
        for (Jugador fich:sobrePasanCapacidad){
            for(Fichaje fichajes: sis.getFichajes()){
            if(fich==fichajes.getJugadorFichado()){
            System.out.println("Jugador: "+fich.getNombre()+" "+ fich.getApellido()+" Equipo: "+ fichajes.getEquipoFichado().getNombre()+" Posicion: "+fich.getPosicion().name());
                }
            }
        }

        System.out.println("DEMOSTRACION PUNTO 3D");
        HashSet<Jugador>listadoNocorrespondientes=new HashSet<>();
        listadoNocorrespondientes=sis.jugadoresNoCorrespondientes();
        for (Jugador player:listadoNocorrespondientes){
            System.out.println("Nombre: "+ player.getNombre()+" "+ player.getApellido());
        }

        System.out.println("DEMOSTRACION PUNTO 3E");
        HashSet<Manager>masDeDosJugadores=new HashSet<>();
        masDeDosJugadores=sis.masDeDos();
        for (Manager manager:masDeDosJugadores){
            System.out.println("Nombre: "+ manager.getNombre()+" "+ manager.getApellido());
        }

        System.out.println("DEMOSTRACION PUNTO 3F");
        HashSet<Jugador>mejoresPagosPosc=new HashSet<>();
        mejoresPagosPosc=sis.mejoresPagos();
        for (Jugador jug:mejoresPagosPosc){
            System.out.println("Nombre: "+ jug.getNombre()+ " "+ jug.getApellido()+ " Posicion: "+ jug.getPosicion().name()+ " Salario: "+jug.getSalario());
        }

        System.out.println("DEMOSTRACION PUNTO 3G");
        Club menorCantidadMan=new Club();
        menorCantidadMan=sis.menorcantidadManagers();
        System.out.println("Nombre Club: "+ menorCantidadMan.getNombre());

        System.out.println("Demostracion del punto 3H (Puede modificar como no los fichajes, dejo archivo aparte con las queries necesarias para comprobar)");
        sis.modFichajes();

    }
}

