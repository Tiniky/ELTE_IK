package forgalomszim;

public class KisBusz extends Gepjarmu {
    private static final String TIPUS = "kisbusz";
    private static final long IDO = 2000;

    public KisBusz(double fogyasztas, String nev, double uzemanyagSzint) {
        super(fogyasztas, nev, uzemanyagSzint);
    }

    @Override
    public String tipus() {
        return TIPUS;
    }
    
    @Override
    public long ido() {
        return IDO;
    }
}
