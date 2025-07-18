package utalás;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public class Bankfiók {
    private final Map<String, Bankszámla> számlák;
    
    public Bankfiók() {
        this.számlák = new HashMap<>();
    }
    
    public Collection<Bankszámla> számlák() {
        return számlák.values();
    }
    
    public void újSzámla(Bankszámla számla) {
        számlák.put(számla.számlaszám(), számla);
    }
    
    public void számlátTöröl(Bankszámla számla) {
        számlák.remove(számla.számlaszám());
    }
    
    public void átvezet(String terhelendőSzámlaSzáma, String kedvezményezettSzámlaSzáma, int összeg)
            throws NincsFedezetKivétel, NemlétezőSzámlaKivétel, NegatívÖsszegKivétel {
        
        Bankszámla terhelendőSzámla = számlák.get(terhelendőSzámlaSzáma);
        if(terhelendőSzámla == null) {
            throw new NemlétezőSzámlaKivétel(terhelendőSzámlaSzáma);
        }
        Bankszámla kedvezményezettSzámla = számlák.get(kedvezményezettSzámlaSzáma);
        if(kedvezményezettSzámla == null) {
            throw new NemlétezőSzámlaKivétel(kedvezményezettSzámlaSzáma);
        }
        
        terhelendőSzámla.terhel(összeg);
        kedvezményezettSzámla.jóváír(összeg);
    }
    
    public void befizet(String kedvezményezettSzámlaSzáma, int összeg) throws NemlétezőSzámlaKivétel, NegatívÖsszegKivétel{
        Bankszámla kedvezményezettSzámla = számlák.get(kedvezményezettSzámlaSzáma);
        if(kedvezményezettSzámla == null) {
            throw new NemlétezőSzámlaKivétel(kedvezményezettSzámlaSzáma);
        }
        kedvezményezettSzámla.jóváír(összeg);
    }
}
