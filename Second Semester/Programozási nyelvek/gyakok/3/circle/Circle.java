package circle;

import circle.utils.Point;

class Circle{
    private double x, y, radius;

    public Circle(){
        this.x = 0;
        this.y = 0;
        this.radius = 1;
    }

    public Circle(double x, double y, double r){
        this.x = x;
        this.y = y;
        this.radius = r;
    }    

    public Point getCenter(){
        Point p = new Point();
        p.setPoint(this.x, this.y);
        return p;
    }

    public void setCircle(double x, double y, double radius){//helyette 3 külön settert szoktak írni, mindegyik 1-1 mezőt állítana
        if(radius <= 0){//itt így is jó lesz, csak vizsgán majd erre emlékezz! :)
            throw new IllegalArgumentException("a kör sugara legyen pozitiv pls");
        }
        
        this.x = x;
        this.y = y;
        this.radius = radius;
    }

    public double getArea(){
        return this.radius*this.radius*Math.PI;
    }

}