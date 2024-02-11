package hw;

public class Beverage {
    private String name;
    private int legalAge;

    public Beverage(String n, int la){
        if(null == n || la < 1){
            throw new IllegalArgumentException("adj meg mas adatokat pls");
        }
        this.name = n;
        this.legalAge = la;
    }

    public String getName(){
        return this.name;
    }

    public int getLegalAge(){
        return this.legalAge;
    }
}
