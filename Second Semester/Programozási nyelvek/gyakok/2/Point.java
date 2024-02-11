class Point{
    public double x, y;

    public void move(double x, double y){
        this.x += x;
        this.y += y;
    }

    public void mirror(Point p){
        double dx = p.x - this.x;
        double dy = p.y - this.y;
        this.move(2*dx,2*dy);
    }

    public double distance(Point p){
        return Math.sqrt((this.x-p.x)*(this.x-p.x) + (this.y-p.y)*(this.y-p.y));
    }
}