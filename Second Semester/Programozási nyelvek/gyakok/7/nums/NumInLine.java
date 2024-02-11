import java.io.*;

public class NumInLine {

    public static void main(String[] args) {
        try(BufferedReader r = new BufferedReader(new FileReader("in.txt"));
            BufferedWriter w = new BufferedWriter(new FileWriter("out.txt"))){

            String line = null;
            while(null != (line = r.readLine())){
                
                String[] sor = line.split(" ");
                int first = Integer.parseInt(sor[0]);
                String[] nums = sor[1].split(",");

                int n1 = 0;
                int n2 = 0;
                Boolean van = false;

                for(int i=0; i<nums.length; i++){
                    for(int j=0; j<nums.length; j++){
                        if(i != j && first == Integer.parseInt(nums[i])+Integer.parseInt(nums[j])){
                            n1 = Integer.parseInt(nums[j]);
                            n2 = Integer.parseInt(nums[i]);
                            van = true;
                            break;
                        }
                    }
                }

                if(van){
                    w.write(first + " " + n1 + " " + n2 + "\n");
                } else{
                    w.write(first + " none\n");
                }
    
            }
        } catch(Exception e){
            System.out.println("unable to can");
        }
    }
}