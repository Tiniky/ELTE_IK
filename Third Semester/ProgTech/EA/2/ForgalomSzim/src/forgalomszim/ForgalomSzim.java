package forgalomszim;

public class ForgalomSzim {
    public static void main(String[] args) {
        new Szemelygepkocsi(12.0, "ftn", 73.4).start();
        new Szemelygepkocsi(12.0, "ntf", 120.9).start();
        new KisBusz(120.0, "FTN", 730.4).start();
        new KisBusz(120.0, "NTF", 1200.923).start();
    }
    
}
