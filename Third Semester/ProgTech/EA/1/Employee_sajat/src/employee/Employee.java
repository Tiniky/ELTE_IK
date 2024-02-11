/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Main.java to edit this template
 */
package employee;

import java.util.ArrayList;
import java.util.Scanner;

/**
 *
 * @author 40757
 */
public class Employee {

    private String firstName, lastName;
    private String job;
    private int salary;

    public Employee(String firstName, String lastName, String job, int salary) {
        this.firstName = firstName;
        this.lastName = lastName;
        this.job = job;
        this.salary = salary;
    }

    public String getFirstName() {
        return firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public String getJob() {
        return job;
    }

    public int getSalary() {
        return salary;
    }
    
    public void raiseSalary(int percent){
        salary = (int)(salary * (1.0 + percent/100.0));
    }

    @Override
    public String toString() {
        return firstName + " " + lastName + " (" + job + ") fizetese " + salary;
    }
    
    
    
    private static String readString(Scanner sc, String msg){
        System.out.print(msg);
        return sc.nextLine();
    }
    
    private static int readInt(Scanner sc, String msg){
        System.out.print(msg);
        int i = sc.nextInt();
        sc.nextLine();
        return i;
    }
    
    /**
     * @param args the command line arguments
     */
    public static void main(String[] args) {
        // TODO code application logic here
        //Employee e = new Employee("Gipsz", "Jakab", "sef", 2000);
        //System.out.println(e.getFirstName() + " " + e.getLastName() + " (" + e.getJob() +")'s salary " + e.getSalary());
        
        Scanner sc = new Scanner(System.in);
        ArrayList<Employee> employees = new ArrayList<>();
        
        for(int i = 0; i<3; i++){
            employees.add(readEmployee(sc));
        }
                
        int raise = readInt(sc, "Emelés mértéke (%) =  ");
        String job = readString(sc, "Érintett beosztás: ");
        
        for(Employee e : employees){
            if(e.getJob().equals(job)) e.raiseSalary(raise);
            System.out.println(e);
        }
        
        Employee richMan = employees.get(0);
        for(Employee e : employees){
            if(e.getSalary() > richMan.getSalary()){
                richMan = e;
            }
        }
        
        //Employee f = readEmployee(sc);
        //System.out.println(f);
        
        //f.raiseSalary(10);
        //System.out.println(f);

    }

    private static Employee readEmployee(Scanner sc) {
        String firstName = readString(sc, "Vezeteknev: ");
        String lastName = readString(sc, "Keresztnev: ");
        String job = readString(sc, "Beosztas: ");
        int salary = readInt(sc, "Fizetes: ");
        Employee f = new Employee(firstName, lastName, job, salary);
        return f;
    }
    
}
