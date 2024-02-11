package forgalomszim;
public class Szemelygepkocsi extends Gepjarmu{
    private static final String TIPUS = "auto";
    private static final long IDO = 1000;

    public Szemelygepkocsi(double fogyasztas, String nev, double uzemanyagSzint) {
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
