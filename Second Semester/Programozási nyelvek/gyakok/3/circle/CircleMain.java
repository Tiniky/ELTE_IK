package circle;

import circle.utils.Point;

public class CircleMain {
    public static void main(String[] args){
        Circle c = new Circle();
        double ter = c.getArea();
        System.out.println("terület: " + ter);

        //c.setCircle(5,2,10);
        Circle d = new Circle(5,2,10);

        ter = d.getArea();
        System.out.println("terület: " + ter);

        Point p = new Point();
        p = c.getCenter();

        System.out.println("x = " + p.getX() + ", y = " + p.getY());

    }
}
