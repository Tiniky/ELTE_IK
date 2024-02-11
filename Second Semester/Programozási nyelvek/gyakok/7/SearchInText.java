import java.io.*;

public class SearchInText {
    public static void main(String[] args) {
        if(args.length != 1){
            throw new IllegalArgumentException("addj meg parameternek egy szovegfajlt");
        }

        try(BufferedReader br = new BufferedReader(new FileReader(args[0]));){
            String line = null;
            int DB = 0;
            String keresettSzoveg = System.console().readLine("keresett szoveg: ");

            while(null != (line = br.readLine())){
                String[] szavak = line.split(" ");
                for(int i=0; i<szavak.length ; i++){
                    if(szavak[i].equals(keresettSzoveg)){
                        DB++;
                    }
                }
            }

    
    
            /*try {
                br = new BufferedReader(new FileReader("in.txt"));*/    
            } catch (IllegalArgumentException e) {
                System.out.println("ILLEGAL");
            } catch (FileNotFoundException e) {
                System.out.println("Couldn't find in.txt");
            } catch (IOException e) {
                System.out.println("Couldn't read line");
            } catch (Exception e) {
                System.out.println("unable to can");
            }
    }


    
}
