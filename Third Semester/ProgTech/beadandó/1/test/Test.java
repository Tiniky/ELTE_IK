import java.io.BufferedReader;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.Scanner;

public class Test{


    public static void main(String[] args) throws IOException, Exception {
        if(args.length != 1){
            throw new IllegalArgumentException("No input file given");
        }
        BufferedReader br = new BufferedReader(new FileReader(args[0]));
        
        /*String data = br.readLine();

        while(null != data){
            
            List<String> datas = new ArrayList<String>(Arrays.asList(data.split(" , ")));

            Scanner s = new Scanner(data);

            System.out.println(s.nextInt());
            System.out.println(s.next());
            data = br.readLine();
        }*/

        int db = 3;
        for(int i=0; i<db; i++){
            String data = br.readLine();
            Scanner s = new Scanner(data);

            int count = s.nextInt();
            switch(s.next()){
                case "property": System.out.println(count + " ingatlan van");
                    break;
                case "luck": System.out.println(count + " szerencse van");
                    break;
                case "service": System.out.println(count + " szolgaltatas van");
            }

            s.close();
        }

        
    }

}