import java.util.HashSet;
import java.util.List;

public class Controlador {
    private AccesoBaseDeDatos acc;
    private HashSet<Club>clubes;

    public Controlador(String nombreBase, List<String>tablas) {
        AccesoBaseDeDatos acc;
        this.acc = acc=new AccesoBaseDeDatos(nombreBase,tablas);
    }

    public void Conectar(String user,String password){
        acc.conectar(user, password);
    }
    public HashSet<Club>listadoClubes(){
        HashSet<Club>listado=new HashSet<>();
        acc.obtenerColumnasDeUnaTabla("EquipoFutbol");





        return listado;
    }
}
