public class PrintedBook extends Book {

    public static enum Cover{
        Hardcover,
        Softcover;
    }

    private Cover covertype;

    public PrintedBook(String a, String t, int p, Cover c){
        super(a, t, p + 6);
        this.covertype = c;
    }

    public PrintedBook(){
        super();
        this.covertype = Cover.Hardcover;
        this.pages += 6;
    }
    
    @Override
    public String toString(){
        return super.toString() + " " + this.covertype.name();
    }

    public int getPrice(){
        int price;

        if(this.covertype == Cover.Softcover){
            price = this.pages * 2;
        } else {
            price = this.pages * 3;
        }

        return price;
    }

    @Override
    public String createReference(String cikknev, int kezd, int veg){
        return this.toString() + " [" + kezd + "-" + veg + "] referenced in article: " + cikknev;
    }
}
