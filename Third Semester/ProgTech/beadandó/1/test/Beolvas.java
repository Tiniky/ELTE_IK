import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

public class Beolvas{

    /**
     * @param fields
     * @param players
     * @param diceRolls
     * @param br
     * @throws IOException
     * @throws Exception
     */
    public static void createAll(ArrayList<String> fields, ArrayList<String> players, ArrayList<Integer> diceRolls, BufferedReader br) throws IOException, Exception{
        int db = Integer.parseInt(br.readLine());
        
        int i = 0;
        while(i<db){
            i++;
            String[] data = br.readLine().split("\t");
            switch(data[0]){
                case "p": fields.add("property");
                case "l": fields.add("luck");
                case "s": fields.add("service");
                //default: throw new Exception("Something is off about that input file.");
            }
        }
        
        db = Integer.parseInt(br.readLine());
        int j = 0;
        while(j<db){
            j++;
            String[] data = br.readLine().split("\t");
            switch(data[1]){
                case "mohó": players.add(data[0]);
                case "taktikus": players.add(data[0]);
                case "óvatos": players.add(data[0]);
                //default: throw new Exception("Something is off about that input file.");
            }
        }
        
        String dice = br.readLine();
        
        if(dice != null){
            db = Integer.parseInt(dice);
            for(int index=0; index<db; index++){
                diceRolls.add(Integer.valueOf(br.readLine()));
            }
        }
    }

    public static void main(String[] args) throws IOException, Exception {
        if(args.length != 1){
            throw new IllegalArgumentException("No input file given");
        }
        
        ArrayList<String> fields = new ArrayList<>();
        ArrayList<String> players = new ArrayList<>();
        ArrayList<Integer> diceRolls = new ArrayList<>();
        BufferedReader br = new BufferedReader(new FileReader(args[0]));
        
        createAll(fields, players, diceRolls, br);

        for(String p : players){
            System.out.println(p);
        }

        for(String f : fields){
            System.out.println(f);
        }

    }

}