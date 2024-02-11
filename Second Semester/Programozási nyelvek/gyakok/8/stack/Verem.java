package stack;

import java.util.Arrays;
import java.util.NoSuchElementException;

public class Verem{
    private int[] elemek;

    public Verem(){
        this.elemek = new int[]{};
    }

    public void push(int n){
        this.elemek[this.elemek.length] = n;
    }

    public int pop(){
        if(this.elemek.length == 0){
            throw new NoSuchElementException();
        }
        
        int last = this.elemek[this.elemek.length - 1];
        this.elemek = Arrays.copyOf(this.elemek, this.elemek.length - 1);
        return last;
    }

    public Boolean empty(){
        return this.elemek.length == 0;
    }

    public int size(){
        return this.elemek.length;
    } 
}