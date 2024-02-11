import java.util.ArrayList;

public class InList {
    int aktualis, maximalis;
    ArrayList <Integer> nums;


    InList(int m){
        this.maximalis = m;
        this.aktualis = 0;
        this.nums = new ArrayList<>();
    }

    void add(int a){
        if(this.aktualis < this.maximalis-1){
            this.nums.add(a);
            this.aktualis++;
        } else {
            throw new IllegalStateException("az adott lista túl kicsi");
        }
    }

    void concat(InList x){
        if(this.aktualis + x.aktualis < this.maximalis-1){
            for(int i=0; i<this.nums.size(); i++){
                this.nums.add(x.nums.get(i));
                this.aktualis++;
            } 
        } else {
            throw new IllegalStateException("az adott lista túl kicsi");
        }
    }

    public String toString(){
        if(this.aktualis == 0){
            return "empty";
        } else {
            StringBuilder s = new StringBuilder();

            for(int i=0; i<this.nums.size(); i++){
                s.append(this.nums.get(i)).append(", ");
            }

            return s.toString();
        }
    }

    public static void main(String[] args) {
        InList n1 = new InList(5);
        InList n2 = new InList(4);
        InList n3 = new InList(10);

        n2.add(2);
        n2.add(10);
        n2.add(27);
        n2.add(404);

        n3.add(1);
        n3.add(2);
        n3.add(3);
        n3.add(4);
        n3.add(5);
        n3.concat(n2);

        System.out.println(n1.toString());
        System.out.println(n2.toString());
        System.out.println(n3.toString());
    }


}
