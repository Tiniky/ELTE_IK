import java.util.*;

public class InList2 {
    private int aktualis, maximalis;
    private ArrayList <Integer> nums;

    InList2(int m){
        this.maximalis = m;
        this.aktualis = 0;
        this.nums = new ArrayList<Integer>(this.maximalis);
    }

    InList2(ArrayList <Integer> a){
        if(a.size() < this.maximalis){
            this.nums.addAll(a);
            this.maximalis = a.size();
            this.aktualis = this.maximalis - 1;
        }
    }

    public void add(int n){
        if(this.aktualis < this.maximalis){
            this.nums.add(n);
            this.aktualis++;
        } else {
            throw new IllegalStateException();
        }
    }

    public void concat(InList2 x){
        if(this.aktualis + x.aktualis < this.maximalis){
            for(int i=0; i<= x.aktualis; i++){
                this.nums.add(x.nums.get(i));
                this.aktualis++;
            }
            this.aktualis--;
        } else {
            throw new IllegalStateException();
        }
    }

    @Override
    public String toString(){
        StringBuilder s = new StringBuilder();

        if(this.aktualis == 0){
            return "empty";
        } else {
            for(int i=0;i<this.aktualis; i++){
                s.append(this.nums.get(i)).append(" ");
            }

            return s.toString();
        }
    }

    public void removeItemsGreaterThan(int limit){
        InList2 temp = new InList2(this.maximalis);
        
        for(int i = 0; i <= this.aktualis; i++){
            if(this.nums.get(i) < limit){
                temp.nums.add(this.nums.get(i));
                temp.aktualis++;
            }
        }

        this.nums = new ArrayList<Integer>(Collections.nCopies(this.maximalis, 0));

        this.nums.addAll(temp.nums);
        this.aktualis = temp.aktualis-1;
    }

    public static void main(String[] args) {
        InList2 a1 = new InList2(10);

        System.out.println(a1.toString());

        ArrayList <Integer> asd = new ArrayList<Integer>();

        asd.add(2);
        asd.add(10);
        asd.add(27);
        asd.add(404);

        InList2 a2 = new InList2(asd);

        System.out.println(a2.toString());

        a2.add(1);
        a2.add(2);
        a2.add(3);
        a2.add(4);
        a2.add(5);
        a2.concat(a1);

        System.out.println(a1.toString());

        a2.removeItemsGreaterThan(4);
        System.out.println(a1.toString());
    }

}
