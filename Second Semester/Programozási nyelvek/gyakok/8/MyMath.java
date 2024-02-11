public class MyMath {
    public static double power(int base, int power){
        if(power < 0){
            double res = 1;
            for(int i=0; i< power*(-1); i++){
                res *= base;
            }
            return 1/res; 
        }
    
        if(power == 0){
            return 1.0;
        }

        double res = 1;
        for(int i=0; i< power; i++){
            res *= base;
        }
        return res;
    }

}