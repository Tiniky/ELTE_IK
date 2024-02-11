public class Berserker extends Orc{

    public Berserker(String n, int hp, int ap){
        super(n, hp, ap);
    }

    @Override
    public void applyDamageFrom(Character c){
        this.setHP(this.getHP() - 2 * c.getAP());
    }
}