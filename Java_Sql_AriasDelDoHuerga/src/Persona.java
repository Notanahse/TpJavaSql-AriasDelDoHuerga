import java.time.LocalDate;

public class Persona {
    private String nombre;
    private String apellido;
    private LocalDate nacimiento;
    private int DNI;

    public Persona( String nombre, String apellido, int DNI,LocalDate nacimiento) {
        this.nombre = nombre;
        this.apellido = apellido;
        this.DNI = DNI;
        this.nacimiento=nacimiento;
    }

    public Persona() {
        nacimiento=LocalDate.now();
    }

    public LocalDate getNacimiento() {
        return nacimiento;
    }

    public void setNacimiento(LocalDate nacimiento) {
        this.nacimiento = nacimiento;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public int getDNI() {
        return DNI;
    }

    public void setDNI(int DNI) {
        this.DNI = DNI;
    }
}
