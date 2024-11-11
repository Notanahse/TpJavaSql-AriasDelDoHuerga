import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;

public class Controlador {
    private AccesoBaseDeDatos acc;
    private HashSet<Club>clubes;
    private HashSet<Manager>managers;

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
    public void InstanciarJugadores(){
        HashMap<Integer,HashMap<String,Object>>resultadoLista=new HashMap<>();
        resultadoLista=acc.Lista("Persona");
        for(HashMap<String,Object>columna:resultadoLista.values()){
                if((Integer) columna.get("Manager") ==1){
                    int id= acc.obtenerId("Managers","idManager",columna.get("idPersona"));
                   Manager m= new Manager(id,(String) columna.get("Nombre"),(String) columna.get("Apellido"),(Integer) columna.get("DNI"));
                   this.managers.add(m);
                } else if ((Integer) columna.get("Manager")==0) {
                    HashMap<String,Object>valoresRestantes=acc.selectValores("Jugador","Representante,Salario","idPersona2",(String) columna.get("idPersona"));
                    Manager n=new Manager();
                    for (Manager l:managers){
                        if(l.getId()==(Integer) valoresRestantes.get("Representante")){
                            n=l;
                        }
                    }
                    Jugador j=new Jugador((String) columna.get("Nombre"),(String)columna.get("Apellido"),(Integer) columna.get("DNI"),n,(Integer) valoresRestantes.get("Salario"));
                }
        }
    }
}
