package utalás;

public class Bankszámla {

    private final String számlaszám;
    private int egyenleg;
    private final String tulajdonosNeve;
    
    public Bankszámla(String számlaszám, String tulajdonosNeve) {
        this.számlaszám = számlaszám;
        this.tulajdonosNeve = tulajdonosNeve;
        this.egyenleg = 0;
    }
    
    public String számlaszám() {
        return this.számlaszám;
    }

    public int egyenleg() {
        return this.egyenleg;
    }

    public String tulajdonosNeve() {
        return tulajdonosNeve;
    }
    
    public synchronized void jóváír(int összeg) throws NegatívÖsszegKivétel {
        if(összeg < 0) {
            throw new NegatívÖsszegKivétel();
        }
        egyenleg += összeg;
    }
    
    public synchronized void terhel(int összeg) throws NincsFedezetKivétel, NegatívÖsszegKivétel {
        if(összeg < 0) {
            throw new NegatívÖsszegKivétel();
        }
        if(egyenleg < összeg) {
            throw new NincsFedezetKivétel(this, összeg);
        }
        egyenleg -= összeg;
    }
    
}
