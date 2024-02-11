public class Line {
    public double a, b, c;

    public boolean contains(Point p){
        return this.a*p.x + this.b*p.y == c; 
    }

    public boolean isParallelWith(Line l){
        return this.a/l.a == this.b/l.b;
    }

    public boolean isOrthogonalTo(Line l){
        return this.a*l.a + this.b*l.b == 0;
    }

    public static void main(String[] args){
        Line l1 = new Line();
        Line l2 = new Line();
        Line l3 = new Line();

        l1.a = -3;
        l1.b = 5;
        l1.c = 12;

        l2.a = 10;
        l2.b = 6;
        l2.c = 7;

        l3.a = 12;
        l3.b = -20;
        l3.c = 13;

        Point p = new Point();
        p.x = -4;
        p.y = 0;

        boolean rajtaVan = l1.contains(p);
        if(rajtaVan){
            System.out.println("(" + p.x + ", " + p.y + ") rajta van a(z) " + l1.a + "x + " + l1.b + "y = " + l1.c + " egyenletű egyenesen");
        } else {
            System.out.println("(" + p.x + ", " + p.y + ") nincs rajta a(z) " + l1.a + "x + " + l1.b + "y = " + l1.c + " egyenletű egyenesen");
        }

        rajtaVan = l2.contains(p);
        if(rajtaVan){
            System.out.println("(" + p.x + ", " + p.y + ") rajta van a(z) " + l2.a + "x + " + l2.b + "y = " + l2.c + " egyenletű egyenesen");
        } else {
            System.out.println("(" + p.x + ", " + p.y + ") nincs rajta a(z) " + l2.a + "x + " + l2.b + "y = " + l2.c + " egyenletű egyenesen");
        }

        boolean parhuzamos = l1.isParallelWith(l3);
        if(parhuzamos){
            System.out.println("az " + l1.a + "x +" + l1.b + "y = " + l1.c + " egyenletű egyenes párhuzamos a " + l3.a + "x + (" + l3.b + ")y = " + l3.c + " egyenletű egyenessel");
        } else {
            System.out.println("az " + l1.a + "x +" + l1.b + "y = " + l1.c + " egyenletű egyenes párhuzamos a " + l3.a + "x + " + l3.b + "y = " + l3.c + " egyenletű egyenessel");
        }

        boolean meroleges = l1.isParallelWith(l2);
        if(meroleges){
            System.out.println("az " + l1.a + "x +" + l1.b + "y = " + l1.c + " egyenletű egyenes merőleges a " + l2.a + "x + " + l2.b + "y = " + l2.c + " egyenletű egyenessel");
        } else {
            System.out.println("az " + l1.a + "x +" + l1.b + "y = " + l1.c + " egyenletű egyenes merőleges a " + l2.a + "x + " + l2.b + "y = " + l2.c + " egyenletű egyenessel");
        }

    }
    
}
