public class Book {
    
    private enum Genre{
        FANTASY,
        SATIRE,
        SCIFI,
        PHILOSOPHY,
        EDUCATIONAL;
    }

    private String iro, cim;
    private int ar, id;
    private static int ID;

    private Book(String n, String t, String g, int p){
        this.iro = n;
        this.cim = t;
        Genre.valueOf(g);
        this.ar = p;
        this.id = ++ID;
    }

    public Book make(String n, String t, String g, int p){// itt sok null check meg ellenrzés kell majd kontruktor hívás elött :D Gonosz a feladat
        if(n == null || t == null || n.length()<=2 || t.length() <=2){
            return null;
        } else{

            Boolean nincsSpecKar = true;
            for(int i=0; i<t.length(); i++){
                if(Character.isLetterOrDigit(t.charAt(i)) == false && t.charAt(i) != ' '){
                    nincsSpecKar = false;
                }
            }

            if(!nincsSpecKar){
                return null;
            }

        }

        if(p < 0){
            return null;
        }

        Boolean joGenre; 

        switch(g){
            case "FANTASY": joGenre = true;
            case "SATIRE": joGenre = true;
            case "SCIFI": joGenre = true;
            case "PHILOSOPHY": joGenre = true;
            case "EDUCATIONAL": joGenre = true;
            default: joGenre = false;
        }

        if(!joGenre){
            return null;
        }

        return new Book(n, t, g, p);
    }


//javac is not recognized az csúnyán néz ki. Itt valami globális Windows változó nincs beállítva. Ez mindig így volt? o.O
//nem, Ubuntut használok usually csak gondoltam kipróbálom itt is de nem jött össze
// hupsz, bocsi! Még itt is sikerült a szavadba vágnom! :D Ha meg akarod fixálni, akkor ez egy jó guide: https://confluence.atlassian.com/doc/setting-the-java_home-variable-in-windows-8895.html
//oké köszi
}
