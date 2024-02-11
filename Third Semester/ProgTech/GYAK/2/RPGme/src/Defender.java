public class Defender extends Orc{

    public Defender(String n, int hp, int ap){
        super(n, hp, ap);
    }

    @Override
    public void applyDamageFrom(Character c){
        this.setHP(this.getHP() - (int)(c.getAP()/2));
    }
}