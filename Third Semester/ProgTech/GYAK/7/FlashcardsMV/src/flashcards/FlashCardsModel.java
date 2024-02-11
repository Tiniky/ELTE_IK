package flashcards;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

/**
 *
 * @author tinik
 */
public class FlashCardsModel {
    private ArrayList<Card> cards;
    private int cardNumber;
    private boolean showQuestion;
    private int score;

    public FlashCardsModel() {
        cards = new ArrayList<>();
    }

    public String currentCardText() {
        if (hasCards() && getCardNumber() < numCards()) {
            if (isShowQuestion()) {
                return getCurrentCard().getQuestion();
            } else {
                return getCurrentCard().getAnswer();
            }
        } else if (hasCards()) {
            String finalScore = "Your final score was: " + score + "/" + cardNumber;
            
            if(score - cardNumber == 0){
                return finalScore + " :D GG";
            } else if(score > cardNumber/2){
                return finalScore + " COME ON YOU CAN DO BETTER THAN THIS";
            } else
                return finalScore + " o.o let's pretend this did not happen..";
        }
        return "Please open a cards file...";
    }

    public void read(File file) throws FileNotFoundException, IOException {
        BufferedReader br = new BufferedReader(new FileReader(file));
        String line;
        while ((line = br.readLine()) != null) {
            String[] qa = line.split("~");
            if (qa.length == 2) {
                addCard(qa[0], qa[1]);
            }
        }
    }

    public void nextCard(boolean incScore) {
        if (hasCards() && cardNumber < cards.size()) {
            if (incScore) {
                score++;
            }
            cardNumber++;
            showQuestion = true;
        }
    }

    public void addCard(String question, String answer) {
        cards.add(new Card(question, answer));
    }

    public Card getCurrentCard() {
        return cards.get(cardNumber);
    }

    public boolean hasCards() {
        return !cards.isEmpty();
    }

    public int numCards() {
        return cards.size();
    }

    public void reset() {
        score = 0;
        cardNumber = 0;
        showQuestion = true;
    }

    public int getCardNumber() {
        return cardNumber;
    }

    public void setShowQuestion(boolean showQuestion) {
        this.showQuestion = showQuestion;
    }

    public boolean isShowQuestion() {
        return showQuestion;
    }

    public int getScore() {
        return score;
    }
    
}
