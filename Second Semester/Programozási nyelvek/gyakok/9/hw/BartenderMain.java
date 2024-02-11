package hw;

public class BartenderMain {
    public static void main(String[] args) {
        Adult a = new Adult("Geralt of Rivia", 92);
        Minor m = new Minor("Pikachu", 12);

        Beverage b = new Beverage("feltúrbózott gumibogyószörp", 18);

        Bartender boi = new Bartender();

        boolean rend1 = boi.order(b, a);
        if(rend1){
            System.out.println(a.getName() + "! Itt a gumibogyószörp uram!");
        } else {
            System.out.println(a.getName() + " :c Gyere vissza pár év múlva!");
        }

        boolean rend2 = boi.order(b, m);
        if(rend2){
            System.out.println(m.getName() + "! Itt a gumibogyószörp uram!");
        } else {
            System.out.println(m.getName() + " :c Gyere vissza pár év múlva!");
        }
    }
}
