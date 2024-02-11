import java.util.*;

public class InList{
    private int aktualis, maximalis;
    private int[] nums;

    InList(int m){
        this.maximalis = m;
        this.aktualis = 0;
        this.nums = new int[this.maximalis];
    }

    public void add(int n){
        if(this.aktualis < this.maximalis){
            this.nums[this.aktualis] = n;
            this.aktualis++;
        } else {
            throw new IllegalStateException();
        }
    }

    public void concat(InList x){
        if(this.aktualis + x.aktualis < this.maximalis){
            for(int i = 0; i <=x.aktualis; i++){
                this.nums[this.aktualis] = x.nums[i];
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
                s.append(this.nums[i]).append(" ");
            }

            return s.toString();
        }
    }

    public void removeItemsGreaterThan(int limit){
        InList temp = new InList(this.maximalis);
        
        for(int i = 0; i <= this.aktualis; i++){
            if(this.nums[i] < limit){
                temp.nums[temp.aktualis] = this.nums[i];
                temp.aktualis++;
            }
        }

        Arrays.fill(this.nums, 0);

        this.nums = Arrays.copyOf(temp.nums, this.maximalis);
        this.aktualis = temp.aktualis-1;
    }


    public static void main(String[] args) {
        InList a1 = new InList(5);
        InList a2 = new InList(10);

        System.out.println(a1.toString());

        a1.add(2);
        a1.add(10);
        a1.add(27);
        a1.add(404);

        System.out.println(a1.toString());

        a2.add(1);
        a2.add(2);
        a2.add(3);
        a2.add(4);
        a2.add(5);
        a2.concat(a1);

        System.out.println(a2.toString());

        a2.removeItemsGreaterThan(3);
        System.out.println(a2.toString());
    }
}