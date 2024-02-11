import java.util.*;
import java.io.*;

public class Bag<T>{
   
    private HashMap<T, Integer> map;

    public void add(T elem){
        if(this.map.containsKey(elem)){
            this.map.put(elem, this.map.get.(elem) + 1);
        } else{
            this.map.put(elem, 1);
        }
    }

    public Integer countOf(T elem){
        if(this.map.containsKey(elem)){
            return this.map.get(elem);
        } else{
            return Integer.valueOf(0);
        }
    }

    public void remove(T elem) throws NotInBagException{
        if(!this.map.containsKey(elem)){
            throw new NotInBagException();
        }
        Integer cnt = this.map.get(elem);
        if( 1 == cnt){
            this.map.remove(elem);
        } else{
        this.map.replace(elem, this.countOf(elem) - 1);
        }
    }
    @Override //nem kell, de illik 
    public String toString(){
        StringBuilder s = new StringBuilder();
        for(HashMap<T, Integer> asd : this.map.entrySet()){
            s.append(asd.getKey()).append(" ").append(asd.getValue()).append("");
        }

        return s.toString();
    }

    public static void main(String[] args) {
        Bag<String> bag = new Bag<>();

        try(BufferedReader br = new BufferedReader(new FileReader("input.txt"))){
            String line = null;
            while(null != (line = br.readLine())){
                String[] lines = line.split("\n");
            }
        } catch (Exception e) {
            System.out.println("unable to can");
        }

        for(String line : lines){
            bag.add(line);
        }

        String statisztika = bag.toString();

        System.out.println(statisztika);
    }

    //nem akar lefutni :c
}