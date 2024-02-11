package pointmain;

import point2d.Point;

public class PointMain {
    public static void main(String[] args){
        Point p1 = new Point(1,1);
        System.out.println("(" + p1.x + " " + p1.y + ")");
        p1.x = 1;
        p1.y = 2;
        System.out.println("(" + p1.x + " " + p1.y + ")");
        p1.move(5,3);
        System.out.println("(" + p1.x + " " + p1.y + ")");
        
        Point p2 = new Point(3,4);
        p2.x = 0;
        p2.y = 0;
        p1.mirror(p2);
        System.out.println("(" + p1.x + " " + p1.y + ")");

        double tav = p1.distance(p2);
        System.out.println(tav);
    }
}