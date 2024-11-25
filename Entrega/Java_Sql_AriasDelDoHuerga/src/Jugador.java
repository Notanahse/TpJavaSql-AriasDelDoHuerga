import java.time.LocalDate;

public class Jugador extends Persona{
    private Manager representante;
    private int Salario;
    private Posiciones posicion;
    private int dorsal;

    public Jugador(String nombre, String apellido, int DNI, Manager representante, int salario, LocalDate nacimiento,int dorsal) {
        super(nombre, apellido, DNI,nacimiento);
        this.representante = representante;
        Salario = salario;
        this.dorsal = dorsal;
    }

    public Jugador() {

    }

    public void setPosicion(Posiciones posicion) {
        this.posicion = posicion;
    }

    public Posiciones getPosicion() {
        return posicion;
    }

    public Manager getRepresentante() {
        return representante;
    }

    public void setRepresentante(Manager representante) {
        this.representante = representante;
    }

    public int getSalario() {
        return Salario;
    }

    public void setSalario(int salario) {
        Salario = salario;
    }
}
