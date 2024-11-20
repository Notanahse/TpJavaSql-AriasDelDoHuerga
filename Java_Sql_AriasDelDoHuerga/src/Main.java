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
        ArrayList<Club>equipos=(ArrayList<Club>) clubes.stream().collect(Collectors.toList());
        HashMap<Posiciones,HashSet<Jugador>>listadoPerPoscicion=equipos.get(0).ListadoPorPosicion();


        Jugador masJoven=new Jugador();
        masJoven=sis.fichajeMasJoven();
        System.out.println(masJoven.getNombre()+" "+masJoven.getApellido()+", "+ ((masJoven.getNacimiento()).getYear()) + " de edad");

        HashSet<Fichaje>sobrePasanCapacidad;
        sobrePasanCapacidad=sis.maxCapSobrepasada();
        for (Fichaje fich:sobrePasanCapacidad){
            System.out.println("ID: "+fich.getIdFichaje()+", Jugador: "+fich.getJugadorFichado().getNombre()+" "+ fich.getJugadorFichado().getApellido()+"Equipo: "+ fich.getEquipoFichado().getNombre());
        }

        HashSet<Manager>listadoNocorrespondientes=new HashSet<>();
        listadoNocorrespondientes=sis.managersNoCorrespondientes();
        for (Manager manager:listadoNocorrespondientes){
            System.out.println("Nombre: "+ manager.getNombre()+" "+ manager.getApellido());
        }

        HashSet<Jugador>mejoresPagosPosc=new HashSet<>();
        mejoresPagosPosc=sis.mejoresPagos();
        for (Jugador jug:mejoresPagosPosc){
            System.out.println("Nombre: "+ jug.getNombre()+ " "+ jug.getApellido()+ " Posicion: "+ jug.getPosicion().name()+ " Salario: "+jug.getSalario());
        }

        Club menorCantidadMan=new Club();
        menorCantidadMan=sis.menorcantidadManagers();
        System.out.println("Nombre Club: "+ menorCantidadMan.getNombre());

        sis.modFichajes();

    }
}
