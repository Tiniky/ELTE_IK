import java.util.*;

public class Magic{

    public static LinkedList<Integer> divisors(int num){
        LinkedList<Integer> res = new LinkedList<>();

        for(int i=1; i<= num; i++){
            if(num%i==0){
                res.add(i);
            }
        }
        return res;
    }

    public static ArrayList<String> getStrSameBeginningAndEnding(ArrayList<String> al){
        return al.stream().filter(str -> null != str && str.length() > 0 && str.charAt(0) == str.charAt(str.length()-1)).collect(ArrayList::new, ArrayList::add, ArrayList::addAll);
    }

    public static void removeStrDifferBeginningAndEnding(ArrayList<String> al) {
        al.removeIf(str -> null != str && str.length() > 0 && str.charAt(0) != str.charAt(str.length()-1));
    }

    public static void minToFront(ArrayList<Integer> al){
        if(al.isEmpty()){
            throw new IllegalArgumentException("üres a lista");
        }

        int minimum = Collections.min(al);
        if(al.get(0) != minimum){
            for(int i=0; i<al.size(); i++){
                if(al.get(i) == minimum){
                    al.remove(i);
                    break;
                }
            }
            al.add(0, minimum);
        }
    }

    public static void main(String[] args) {
        HashMap <String, Integer> multiSet = new HashMap<>();
        //this.hm = new HashMap <>(multiSet)
        System.out.println(divisors(27));

        ArrayList <Integer> n = new ArrayList<>();
        n.add(10);
        n.add(27);
        n.add(2);

        minToFront(n);

        System.out.println(n);
    }
}

