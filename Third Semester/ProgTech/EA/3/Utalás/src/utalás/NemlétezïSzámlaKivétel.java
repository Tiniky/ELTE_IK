package utal�s;


public class Neml�tez�Sz�mlaKiv�tel extends Exception {

    private final String sz�mlasz�m;
    public Neml�tez�Sz�mlaKiv�tel(String sz�mlasz�m) {
        this.sz�mlasz�m = sz�mlasz�m;
    }
    
    public String sz�mlasz�m() {
        return this.sz�mlasz�m;
    }
    
}
