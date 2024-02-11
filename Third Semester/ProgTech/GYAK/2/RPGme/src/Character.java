public abstract class Character{
    private String name;
    private int HP, AP;

    Character(String n, int hp, int ap){
        this.name = n;
        this.HP = hp;
        this.AP = ap;
    }

    public String getName() {return name;}
    public int getHP() {return HP;}
    public int getAP() {return AP;}
    public void setName(String n) {this.name = n;}
    public void setHP(int h) {this.HP = h;}
    public void setAP(int a) {this.AP = a;}

    public void attack(Character c){
        if(isAlive()){
            c.attacked(this);
        }
    }
    
    public void attacked(Character c){
        if(isAlive()){
            applyDamageFrom(c);
        }
    }

    public boolean isAlive(){
        return this.HP >= 0;
    }

    protected void applyDamageFrom(Character c){
        this.setHP(this.getHP()-c.getAP());
    }

}