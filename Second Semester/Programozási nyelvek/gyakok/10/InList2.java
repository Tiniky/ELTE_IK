public class InList2 {
    int aktualis, maximalis;
    int[] nums;


    InList2(int m){
        this.maximalis = m;
        this.aktualis = 0;
        this.nums = new int[this.maximalis];
    }

    void add(int a){
        if(this.aktualis <= this.maximalis-1){
            this.nums[this.aktualis] = a;
            this.aktualis++;
        } else {
            throw new IllegalStateException("az adott lista túl kicsi");
        }
    }

    void concat(InList2 x){
        if(this.aktualis + x.aktualis <= this.maximalis-1){
            for(int i=0; i<this.nums.length; i++){
                this.nums[this.aktualis] = x.nums[i];
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

            for(int i=0; i<this.nums.length; i++){
                s.append(this.nums[i]).append(", ");
            }

            return s.toString();
        }
    }

    public static void main(String[] args) {
        InList2 n1 = new InList2(5);
        InList2 n2 = new InList2(4);
        InList2 n3 = new InList2(10);

        n2.add(2);
        n2.add(10);
        n2.add(27);
        n2.add(404);

        n3.add(1);
        n3.add(2);
        n3.add(3);
        n3.add(4);
        n3.concat(n2);

        System.out.println(n1.toString());
        System.out.println(n2.toString());
        System.out.println(n3.toString());
    }
}
