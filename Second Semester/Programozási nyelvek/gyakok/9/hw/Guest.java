package hw;

public class Guest {
    protected String name;
    protected int age;

    Guest(String name, int age){
        this.name = name;
        this.age = age;
    }

    public String getName(){
        return this.name;
    }

    public int getAge(){
        return this.age;
    }

}
