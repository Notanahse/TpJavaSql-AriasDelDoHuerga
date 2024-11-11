public class Manager extends Persona {
    private int id;
    public Manager( int id,String nombre, String apellido, int DNI) {
        super(nombre, apellido, DNI);
        this.id=id;
    }

    public Manager() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }
}
