
import java.util.ArrayList;
import java.util.Random;

public class Game {
    public static void main(String[] args) {
        ArrayList<Character> characters = new ArrayList<>();
        characters.add(new MainCharacter("The Ranger", 100, 70, 20));
        characters.add(new Berserker("Orc 1", 70, 1000));
        characters.add(new Defender("Orc 2", 200, 10));
        characters.add(new RedDragon("The Red Dragon", 1000, 100));
        
        // meelee
        Random rand = new Random();
        while (characters.size() > 1) {
            int attackerInd = rand.nextInt(characters.size());
            int attackedInd = rand.nextInt(characters.size());
            while (attackerInd == attackedInd) {
                attackedInd = rand.nextInt(characters.size());
            }
            Character attacker = characters.get(attackerInd);
            Character attacked = characters.get(attackedInd);
            attacker.attack(attacked);
            if (!attacked.isAlive()) {
                characters.remove(attackedInd);                
            }
        }
        System.out.println("There can be only one: " + characters.get(0).getName());
    
    }
    
}
