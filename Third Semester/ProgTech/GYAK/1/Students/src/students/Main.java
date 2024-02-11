/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package students;

import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author tinik
 */

public class Main {
    
    public static String readString(Scanner sc, String msg){
        System.out.print(msg);
        return sc.nextLine();
    }
    
    public static double readNum(Scanner sc, String msg){
        System.out.print(msg);
        double i = sc.nextDouble();
        sc.nextLine();
        return i;
    }
    
    public static Students best(ArrayList<Students> s){
        Students ss = s.get(0);
        for(Students e:s){
            if(e.getAvg()>ss.getAvg()){
                ss = e;
            }
        }
        
        return ss;
    }
    
    public static Students worst(ArrayList<Students> s){
        Students ss = s.get(0);
        for(Students e:s){
            if(e.getAvg()<ss.getAvg()){
                ss = e;
            }
        }
        
        return ss;
    }
    
    public ArrayList<Students> scholarship(ArrayList<Students> s){
        ArrayList<Students> smart = new ArrayList<>();
        for(Students e:s){
            if(e.getAvg()>4.0){
                smart.add(e);
            }
        }
        
        return smart;
    }
    
     public static void main(String[] args) {
        ArrayList<Students> studZ = new ArrayList<>();
         
        //Students s1 = new Students("Fábián T. Nikolett", "magyar", 4.33);
        //Students s2 = new Students("Alex Chen", "koreai", 4.79);
        //Students s3 = new Students("Chloe Price", "amerikai", 2.17);
        
        //studZ.add(s1);
        //studZ.add(s2);
        //studZ.add(s3);
        
        Scanner sc = new Scanner(System.in);
        double db = readNum(sc, "How many students are there: ");
        
        for(double i=0.0; i<db; i++){
            String name = readString(sc, "Name: ");
            String nationality = readString(sc, "Nationality: ");
            double avg = readNum(sc, "Average: ");
            
            Students e = new Students(name, nationality, avg);
            studZ.add(e);
        }
        
        Students bestStudent = best(studZ);
        Students worstStudent = worst(studZ);

        
        System.out.println( bestStudent.getName() + " (" + bestStudent.getNationality() + ") " + " has the best grades.");
        System.out.println( worstStudent.getName() + " (" + worstStudent.getNationality() + ") " + " has the worst grades.");
        
        /*for(Students e: studZ){
            if(e.getAvg()>4.0){
                System.out.println(e.getName()+ " (" + e.getNationality() + ") " + " gets scholarship.");
                        
            }
        }*/
    }
}
