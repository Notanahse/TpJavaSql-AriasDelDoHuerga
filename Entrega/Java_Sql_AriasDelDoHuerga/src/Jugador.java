import java.time.LocalDate;

public class Jugador extends Persona{
    private Manager representante;
    private int Salario;
    private Posiciones posicion;
    private int dorsal;
    private Club clubPerteneciente;

    public Jugador(String nombre, String apellido, int DNI, Manager representante, int salario, LocalDate nacimiento,int dorsal) {
        super(nombre, apellido, DNI,nacimiento);
        this.representante = representante;
        Salario = salario;
        this.dorsal = dorsal;
    }

    public Jugador() {

    }

    public Club getClubPerteneciente() {
        return clubPerteneciente;
    }

    public void setClubPerteneciente(Club clubPerteneciente) {
        this.clubPerteneciente = clubPerteneciente;
    }

    public int getDorsal() {
        return dorsal;
    }

    public void setDorsal(int dorsal) {
        this.dorsal = dorsal;
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
