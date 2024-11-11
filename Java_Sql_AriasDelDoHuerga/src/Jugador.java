public class Jugador extends Persona{
    private Manager representante;
    private int Salario;
    private Posiciones posicion;

    public Jugador(String nombre, String apellido, int DNI, Manager representante, int salario) {
        super(nombre, apellido, DNI);
        this.representante = representante;
        Salario = salario;
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
