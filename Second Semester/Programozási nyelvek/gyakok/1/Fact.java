class Fact {
    public static void main(String[] args){
        int n = 0;
        if(args.length > 0){
            n = Integer.parseInt(args[0]);
        } else {
            System.out.print("Fact to calculate: ");
            n = Integer.parseInt(System.console().readLine());
        }

        int res = 1;
        for(int i=1; i<=n; ++i){
            res *= i;
        }

        System.out.println("fact result: " + res);
    }
}
