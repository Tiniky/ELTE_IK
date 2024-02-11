class Args {
    public static void main(String[] args) {
        //System.out.println("args len: " + args.length);
        if(args.length < 2){
            System.out.println("Too few arguments");
            return;
        }
        int a = Integer.parseInt(args[0]), b = Integer.parseInt(args[1]);
        System.out.println("summ: "+ (a + b));
        System.out.println("sub: "+ (a - b));
        System.out.println("mult: "+ (a * b));
        if(b!=0){
        System.out.println("div: "+ (a / (double)b));
        } else {
            System.out.println("Division by Zero");
        }
    }
}