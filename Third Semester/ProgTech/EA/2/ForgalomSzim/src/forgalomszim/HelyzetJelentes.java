package forgalomszim;
public class HelyzetJelentes {
    private final String tipus;
    private final String nev;
    private final double uzemanyagSzint;

    public HelyzetJelentes(String tipus, String nev, double uzemanyagSzint) {
        this.tipus = tipus;
        this.nev = nev;
        this.uzemanyagSzint = uzemanyagSzint;
    }

    public String getTipus() {
        return tipus;
    }

    public String getNev() {
        return nev;
    }

    public double getUzemanyagSzint() {
        return uzemanyagSzint;
    }
    
}
