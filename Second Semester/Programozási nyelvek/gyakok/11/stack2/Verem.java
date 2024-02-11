import java.util.*;

public class Verem<T> {
    
    private ArrayList<T> verem;

    public Verem(){
        this.verem = new ArrayList<T>();
    }

    public void push(T elem){
        this.verem.add(this.verem.size(), elem);
    }

    public T top(){
        if(this.verem.size() == 0){
            throw new NoSuchElementException();
        }

        return this.verem.get(this.verem.size()-1);
    }

    public T pop(){
        if(this.verem.size() == 0){
            throw new NoSuchElementException();
        }
        
        T last = this.verem.get(this.verem.size()-1);
        this.verem.remove(this.verem.size()-1);
        return last;
    }

    public Boolean empty(){
        return this.verem.isEmpty();
    }

    public int size(){
        return this.verem.size();
    }

    public static void main(String[] args) {
        Verem <String> verem1 = new Verem<>();
        Verem <Integer> verem2 = new Verem<>();

        if(verem1.empty()){
            System.out.println("úgy néz ki üres a verem o.o");
        }

        verem1.push("ez");
        verem1.push("egy");
        verem1.push("verem");
        verem1.push("ASD");

        System.out.println(verem1.top());
        System.out.println("a verem mérete: " + verem1.size());
        System.out.println(verem1.pop());
        System.out.println("a verem mérete: " + verem1.size());
        System.out.println(verem1.top());

        verem2.push(2);
        if(!verem2.empty()){
            System.out.println("na ebben már van valami");
        }
        verem2.push(10);
        verem2.push(27);
        verem2.push(-3);

        System.out.println(verem2.top());
        System.out.println("a verem mérete: " + verem2.size());
        System.out.println(verem2.pop());
        System.out.println("a verem mérete: " + verem2.size());
        System.out.println(verem2.top());
    }
}
