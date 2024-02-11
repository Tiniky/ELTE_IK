import java.lang.reflect.Array;
import java.util.ArrayList;
import java.util.HashMap;

public class MultiSet {
    HashMap <String, Integer> asd;

    MultiSet(){
        this.asd = new HashMap<>();
    }

    MultiSet(ArrayList<String> al){
        HashMap<String, Integer> temp = new HashMap<>();

        while(!al.isEmpty()){
            int db = 0;
            String aktualis = al.get(0);
            for(int i=0; i<al.size(); ){
                if(aktualis == al.get(i)){
                    db++;
                    al.remove(i);
                } else {i++;}
            }

            temp.put(aktualis, db);
        }

        this.asd = temp;
    }

    public String getData(){
        StringBuilder s = new StringBuilder();

        for( int i=0; i<this.asd.size(); i++){
            s.append(this.asd.get(i));  //az i nem jó xd
        }

        return s.toString();
    }

    void put(String s){
        boolean van = this.asd.containsKey(s);

        if(!van){
            this.asd.put(s, 1);
        } else{
            Integer i = this.asd.get(s);
            this.asd.replace(s, i+1);
        }
    }


}
