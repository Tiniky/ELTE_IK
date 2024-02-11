public class Book {
    private String author;
    private String title;
    protected int pages;
    
    public Book(String a, String t, int p){
        if(null == a || null == t || p < 1){
            throw new IllegalArgumentException("adj meg normalis erteket pls");
        }
        if(a.length() < 2 || t.length() < 4){
            throw new IllegalArgumentException("adj meg hosszabb stringeket ty");
        }

        this.author = a;
        this.title = t;
        this.pages = p;
    }

    public Book(){
        this("John Steinbeck", "Of Mice and Men", 107);
    }

    public String getShortName(){
        return this.author.substring(0, 2) + " " + this.title.substring(0, 4) + " " + this.pages;
    }

    @Override
    public String toString() {
        return this.author + " " + this.title + " " + this.pages;
    }

    public String createReference(String cikknev, int kezd, int veg){
        return this.getShortName() + " [" + kezd + "-" + veg + "] referenced in article: " + cikknev;
    }
}