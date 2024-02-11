package vector.utils;

public class DoubleVector {
    public double[] nums;

    public DoubleVector(double[] n){
        this.nums = n;
    }

    public DoubleVector add(DoubleVector v){
        double x = this.nums[0] + v.nums[0];
        double y = this.nums[1] + v.nums[1];
        double[] tomb = {x, y};
        DoubleVector v2 = new DoubleVector(tomb);
        return v2;
    }

    public DoubleVector sub(DoubleVector v){
        double x = this.nums[0] - v.nums[0];
        double y = this.nums[1] - v.nums[1];
        double[] tomb = {x, y};
        DoubleVector v2 = new DoubleVector(tomb);
        return v2;
    }

    public DoubleVector skalar(DoubleVector v){
        double x = this.nums[0] * v.nums[0];
        double y = this.nums[1] * v.nums[1];
        double[] tomb = {x, y};
        DoubleVector v2 = new DoubleVector(tomb);
        return v2;
    }

    public DoubleVector ss(double n){
        double x = this.nums[0] * n;
        double y = this.nums[1] * n;
        double[] tomb = {x, y};
        DoubleVector v2 = new DoubleVector(tomb);
        return v2;
    }

    public String toString(){
        return "(" + this.nums[0] + ", " + this.nums[1] + ")";
    }
}
