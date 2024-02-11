public class Point {
    public double x, y;
    private int id;
    private static int id_cnt;

    public void Id(){
        this.id = ++id_cnt;
    }
    public Point(){   
    
    }

    public void setX(double n){
        this.x = n;
    }
    
    public void setY(double n){
        this.y = n;
    }

    public double getX(){
        return this.x;
    }
    
    public double getY(){
        return this.y;
    }

    public String toString() {
        return "(" + this.x + "," + this.y +") id:" + this.id;
    }

    public static Point tomegKozep(Point[] ps, int ind){
        double xAvg = 0, yAvg = 0;
        Point avg = new Point();

        for(int i=0; i<ind; i++){
            xAvg += ps[i].getX();
            yAvg += ps[i].getY();
        }

        avg.setX(xAvg/3);
        avg.setY(yAvg/3);
        return avg;
    }
}
