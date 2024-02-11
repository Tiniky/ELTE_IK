package forgalomszim;

public abstract class Gepjarmu {
    protected final double fogyasztas;
    protected final String nev;
    protected double uzemanyagSzint;

    public Gepjarmu(double fogyasztas, String nev, double uzemanyagSzint) {
        this.fogyasztas = fogyasztas;
        this.nev = nev;
        this.uzemanyagSzint = uzemanyagSzint;
    }
    
    protected abstract String tipus();
    protected abstract long ido();

    public double getFogyasztas() {
        return fogyasztas;
    }

    public double getUzemanyagSzint() {
        return uzemanyagSzint;
    }
    
    public void start(){
        new Thread(
                () -> {
                    boolean lefulladt = false;
                    while(!lefulladt){
                        HelyzetJelentes jelentes = new HelyzetJelentes(tipus(), nev, uzemanyagSzint);
                        Forgalom.peldany().helyzetjelentesKuld(jelentes);
                        lefulladt = uzemanyagSzint < 0.0;
                        uzemanyagSzint -= fogyasztas;
                        try{
                            Thread.sleep(ido());
                        } catch (InterruptedException ex){
                            ex.printStackTrace();
                        }
                    }
                }
        ).start();
    }
}
