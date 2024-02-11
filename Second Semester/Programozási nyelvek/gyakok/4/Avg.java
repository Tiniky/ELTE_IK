class Avg{
    public static void main(String[] args){
        
        //Point[] points = new Point[100];
        //double[] nums = {1.3, 5.2, 7.7, -2.3, 23.45};

        System.out.print("add meg a tömb hosszát: ");
        int n = Integer.parseInt(System.console().readLine());
        double[] nums = new double[n];

        System.out.println("add meg a tömb elemeit! (" + n + ")");
        for(int i=0; i<n; i++){
            nums[i] = Integer.parseInt(System.console().readLine());
        }
        
        double avg = 0;
        for(int i=0; i< nums.length; ++i){
            avg += nums[i];
        }
        
        avg /= nums.length;

        double dx = 99999;
        int dx_ind = 0;

        for(int i=0; i<nums.length; ++i){
            if(dx > Math.abs(avg - nums[i])){
                dx = Math.abs(avg - nums[i]);
                dx_ind = i;
            }
        }
        System.out.println("a legközelebbi szám: " + nums[dx_ind] + ", az átlag pedig: " + avg);
    }
}