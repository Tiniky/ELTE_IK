public class MainCharacter extends Character{
    private double DEF;

    public MainCharacter(String n, int hp, int ap, double def){
        super(n, hp, ap);
        this.DEF = def;
    }

    public double getDEF() {return this.DEF;}

    @Override
    public void applyDamageFrom(Character c){
        this.setHP(this.getHP() - (int)(c.getAP()/this.getDEF()));
    }
}