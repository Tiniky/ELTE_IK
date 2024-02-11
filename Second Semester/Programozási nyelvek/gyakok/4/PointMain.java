public class PointMain {
    public static void main(String[] args){
        //Point p1 = new Point();
        //Point p2 = new Point();
        //Point p3 = new Point();

        System.out.print("add meg a pontok számát: ");
        int db = Integer.parseInt(System.console().readLine());
        Point[] points = new Point[db];
        
        for(int i=0; i<db; i++){
            int n;
            points[i] = new Point();

            System.out.print("add meg az első koordinátáját: ");
            n = Integer.parseInt(System.console().readLine());
            points[i].setX(n);

            System.out.print("add meg a második koordinátáját: ");
            n = Integer.parseInt(System.console().readLine());
            points[i].setY(n);
        }

        Point tomegKP = Point.tomegKozep(points, db);

        String kozep = tomegKP.toString();

        System.out.println("a tömegközéppontja " + kozep);

    }
}
