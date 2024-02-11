package forgalomszim;

public class Forgalom {
    private static Forgalom peldany;
    
    private Forgalom(){}
    
    public static synchronized Forgalom peldany(){
        if(peldany == null){
            peldany = new Forgalom();
        }
        return peldany;
    }
    
    public static synchronized void helyzetjelentesKuld(HelyzetJelentes jelentes){
        String uzemanyagSzintJelzes = jelentes.getUzemanyagSzint() > 0.0 ? Double.toString(jelentes.getUzemanyagSzint()) : "lefulladt";
        
        System.out.println(jelentes.getNev() + "," + jelentes.getTipus() + ":" + uzemanyagSzintJelzes);
    }
}
