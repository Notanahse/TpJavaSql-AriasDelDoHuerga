import java.time.LocalDate;

public class Manager extends Persona {
    private int id;
    public Manager(int id, String nombre, String apellido, int DNI, LocalDate nacimiento) {
        super(nombre, apellido, DNI,nacimiento);
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
