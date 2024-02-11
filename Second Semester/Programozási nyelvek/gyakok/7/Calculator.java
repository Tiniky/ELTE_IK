public class Calculator {
    public static void main(String[] args) {
        if(args.length != 3){
            throw new IllegalArgumentException("addj meg harom parametert!");
        }

        double n1, n2;
        try {
            n1 = Double.parseDouble(args[0]);
            n2 = Double.parseDouble(args[2]);   
        } catch (NumberFormatException e) {
            System.out.println("adj meg ket szamot es kozottuk egy operatort");
        }

        n1 = Double.parseDouble(args[0]);
        n2 = Double.parseDouble(args[2]); 

        double result;
        
        String operator = args[1];
        if(operator.equals("+")){
            result = n1 + n2;
        } else if(operator.equals("-")){
            result = n1 - n2;
        } else if(operator.equals("X")){
            result = n1 * n2;
        } else if(operator.equals("/")){
            if(n2 == 0){
                throw new ArithmeticException("0-val valo osztas");
            }

            result = n1 / n2;
        } else {
            throw new IllegalArgumentException("rossz operator,valassz a kovetkezokbol: + - X /");
        }

        System.out.println(result);
    }
}
