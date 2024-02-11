package vector;
import vector.utils.DoubleVector;

public class VectorMain {
    public static void main(String[] args){
        double[] n1 = {10,27};
        double[] n2 = {5,3};
        double[] n3 = {5,7};
        
        double n = 2;

        DoubleVector v1 = new DoubleVector(n1);
        DoubleVector v2 = new DoubleVector(n2);
        DoubleVector v3 = new DoubleVector(n3);
        
        DoubleVector osszeg = v1.add(v2);
        DoubleVector kivonas = v1.sub(v3);
        DoubleVector skalar = v2.skalar(v3);
        DoubleVector szorz = v2.ss(n);

        System.out.println(v1.toString() + " és " + v2.toString() + " összege: " + osszeg.toString());
        System.out.println(v1.toString() + "-ből " + v3.toString() + ": " + kivonas.toString());
        System.out.println(v2.toString() + " szorozva " + v3.toString() + ": " + skalar.toString());
        System.out.println(v2.toString() + " szorozva " + n + ": " + szorz.toString());
    }
}
