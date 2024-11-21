import java.time.LocalDate;

public class Jugador extends Persona{
    private Manager representante;
    private int Salario;
    private Posiciones posicion;

    public Jugador(String nombre, String apellido, int DNI, Manager representante, int salario, LocalDate nacimiento) {
        super(nombre, apellido, DNI,nacimiento);
        this.representante = representante;
        Salario = salario;
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
