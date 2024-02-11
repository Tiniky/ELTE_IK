import java.io.*;
import java.util.Scanner;

public class FileSum {
    public static void main(String[] args){

        try(BufferedReader br = new BufferedReader(new FileReader("in.txt"));
        BufferedWriter bw = new BufferedWriter(new FileWriter("out.txt"))){
        //BufferedReader br = null;
        String line = null;
        while(null != (line = br.readLine())){
            String[] nums = line.split(",");
            long sum;
            for(int i=0; i<nums.length ; i++){
                sum += Long.parseLong(nums[i]);
            }
            //System.out.println("Sum:: " + sum);
            bw.write("Sum:: " + sum);
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
        } /*finally{
            try {
                br.close();
            } catch (IOException e) {
                System.out.println("Couldn't close text");
            }
        }*/

    }
}
