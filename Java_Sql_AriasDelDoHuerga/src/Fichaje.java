import java.time.LocalDate;

public class Fichaje {
    private int idFichaje;
    private Jugador jugadorFichado;
    private Club EquipoFichado;
    private LocalDate fechaFichaje;
    private EstadoFichaje estado;

    public Fichaje(int idFichaje, Jugador jugadorFichado, Club equipoFichado, LocalDate fechaFichaje, EstadoFichaje estado) {
        this.idFichaje = idFichaje;
        this.jugadorFichado = jugadorFichado;
        EquipoFichado = equipoFichado;
        this.fechaFichaje = fechaFichaje;
        this.estado = estado;
    }

    public int getIdFichaje() {
        return idFichaje;
    }

    public void setIdFichaje(int idFichaje) {
        this.idFichaje = idFichaje;
    }

    public Jugador getJugadorFichado() {
        return jugadorFichado;
    }

    public void setJugadorFichado(Jugador jugadorFichado) {
        this.jugadorFichado = jugadorFichado;
    }

    public Club getEquipoFichado() {
        return EquipoFichado;
    }

    public void setEquipoFichado(Club equipoFichado) {
        EquipoFichado = equipoFichado;
    }

    public LocalDate getFechaFichaje() {
        return fechaFichaje;
    }

    public void setFechaFichaje(LocalDate fechaFichaje) {
        this.fechaFichaje = fechaFichaje;
    }

    public EstadoFichaje getEstado() {
        return estado;
    }

    public void setEstado(EstadoFichaje estado) {
        this.estado = estado;
    }
}
