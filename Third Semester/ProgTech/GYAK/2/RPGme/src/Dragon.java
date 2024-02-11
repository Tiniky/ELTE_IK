public abstract class Dragon extends Character{
    private final int atkTHRESHOLD;

    public Dragon(String n, int hp, int ap, int atk){
        super(n, hp, ap);
        this.atkTHRESHOLD = atk;
    }

    public double getATK() {return this.atkTHRESHOLD;}

    @Override
    public void applyDamageFrom(Character c){
        if(c.getAP()>this.atkTHRESHOLD){
            this.setHP(this.getHP() - c.getAP());
        }
    }
}