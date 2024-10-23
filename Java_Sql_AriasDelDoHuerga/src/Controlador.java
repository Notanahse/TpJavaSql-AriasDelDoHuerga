import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

public class Controlador {
    private AccesoBaseDeDatos acc;
    private HashSet<Club>clubes;

    public Controlador(String nombreBase, List<String>tablas) {
        AccesoBaseDeDatos acc;
        this.acc = acc=new AccesoBaseDeDatos(nombreBase,tablas);
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
        }
        return listado;
    }
}
