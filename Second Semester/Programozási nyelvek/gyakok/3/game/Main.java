package game;

import game.utils.Vehicle;

public class Main {
    public static void main(String[] args){
        Player p1 = new Player();
        p1.name = "Tiniky";
        p1.IP = "12.34.567.89";
        p1.HP = 340250;

        Player p2 = new Player();
        p2.name = "Funonymus";
        p2.IP = "98.76.543.21";
        p2.HP = 9836;

        Vehicle v1 = new Vehicle();
        v1.setModelId(1);
        v1.setNumPlate("ASD66");
        v1.setColor1(5);
        v1.setColor1(7);

        Vehicle v2 = new Vehicle();
        v2.setModelId(3);
        v2.setNumPlate("ASD10");
        v2.setColor1(0);
        v2.setColor1(0);

        Vehicle v3 = new Vehicle();
        v3.setModelId(1);
        v3.setNumPlate("ASD27");
        v3.setColor1(1);
        v3.setColor1(2);

        p1.v = v2;

        String data1 = p1.toString();
        String data2 = p2.toString();

        System.out.println("Player 1's stats | " + data1);
        System.out.println("Player 2's stats | " + data2);
    }
}
