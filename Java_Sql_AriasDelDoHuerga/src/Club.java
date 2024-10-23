public class Club {
    private int idClub;
    private String nombre;

    public Club(int id,String nombre) {
        idClub=id;
        this.nombre=nombre;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }
}
