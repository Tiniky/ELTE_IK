package hw;

public class Bartender {
    public boolean order(Beverage b, Guest g){

        if(b.getLegalAge() == 18 && g.getAge() >= 18){
            return true;
        }
        return false;
    }
}
