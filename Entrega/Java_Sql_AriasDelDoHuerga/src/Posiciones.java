public enum Posiciones {
    ARQUERO(3),DEFENSA(10),MEDIOCAMPO(12),DELANTERO(6);
    private int capMax;

    Posiciones(int capMax) {
        this.capMax = capMax;
    }

    public int getCapMax() {
        return capMax;
    }

    public void setCapMax(int capMax) {
        this.capMax = capMax;
    }
}
