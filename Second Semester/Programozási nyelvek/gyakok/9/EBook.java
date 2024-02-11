public class EBook extends Book {

    private int size;

    public EBook(String a, String t, int p, int s){
        super(a, t, p);
        this.size = s;
    }

    public int getPrice(){
        return this.pages + this.size;
    }

    @Override
    public String createReference(String cikknev, int kezd, int veg){
        return this.toString() + "(PDF size: " + this.size + ") [" + kezd + "-" + veg + "] referenced in article: " + cikknev;
    }

    public String createReference(String cikknev, String datum){
        return this.toString() + "(PDF size: " + this.size + ") referenced in article: " + cikknev + " accessing PDF date: " + datum;
    }
    
}
