public class Circle {
    public double x, y, radius;

    public void enlarge(int x){
        this.radius *= x;
    }

    public double getArea(){
        return this.radius*this.radius*Math.PI;
    }

    public static void main(String[] args){
        Circle c = new Circle();

        c.radius = 2;
        System.out.println("sugár: " + c.radius);
        c.enlarge(5);
        System.out.println("sugár: " + c.radius);
        double ter = c.getArea();
        System.out.println("terület: " + ter);
    }
}
