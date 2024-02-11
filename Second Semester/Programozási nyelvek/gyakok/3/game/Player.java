package game;

import game.utils.Vehicle;

public class Player {
    public String name, IP;
    public int HP;
    public Vehicle v;

    public Player(){
        this.name = "";
        this.IP = "";
        this.HP = 0;
        this.v = null;
    }

    public String toString(){
        if(this.v == null){
            return "name: " + this.name + ", IP: " + this.IP + ", HP: " + this.HP + ", Vehicle: -";
        }
        else{
            return "name: " + this.name + ", IP: " + this.IP + ", HP: " + this.HP + ", Vehicle: " + this.v.getNumPlate();
        }
        
        
    }
}
