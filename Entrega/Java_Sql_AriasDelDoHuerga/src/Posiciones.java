public enum Posiciones {
    ARQUERO(2),DEFENSA(4),MEDIOCAMPO(5),DELANTERO(3);
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
