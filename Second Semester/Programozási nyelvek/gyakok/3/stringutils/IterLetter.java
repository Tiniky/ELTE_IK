package stringutils;

public class IterLetter {
    public String szoveg;
    public int index;

    public IterLetter(String szoveg){
        if(szoveg == null){
            throw new IllegalArgumentException("adj meg valamit pls");
        }

        this.szoveg = szoveg;
        this.index = 0;
    }

    public Character printNext(){
        int i = this.index;
        Character aktualis = this.szoveg.charAt(i);
        this.index++;
        return aktualis;
    }
}
