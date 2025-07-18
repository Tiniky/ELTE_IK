/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package hu.elte.inf;

import java.awt.Color;
import java.awt.Dimension;
import java.awt.FlowLayout;
import java.util.ArrayList;
import java.util.ListIterator;
import javax.swing.JButton;
import javax.swing.JLabel;

/**
 *
 * @author swinkx
 */
public class KancsoPanel extends javax.swing.JPanel {

    private final ArrayList<JButton> buttons = new ArrayList<>();
    private int liter = 0;

    /**
     * Creates new form KancsoPanel
     */
    public KancsoPanel() {

        initComponents();
//        setLayout(new FlowLayout());

    }

    public KancsoPanel(int m, int l){
        this();
        setLiter(m, l);
    }

    private void setLiter(int m, int l){

        setLayout(new java.awt.GridLayout(m, 1));
        for(int i = 0; i < m - l ; i++) {
            JLabel label = new JLabel();
            label.setPreferredSize(new Dimension(70, 25));
            add(label);
        }
        for(int i = 0; i < l; i++){
            JButton b = new JButton();
            b.setPreferredSize(new Dimension(70, 25));
            buttons.add(b);
            add(b, m-l+i);
        }
    }

    public int getLiter(){
        return liter;
    }

    public int setLiter(int l){
        ListIterator<JButton> li = buttons.listIterator(buttons.size());

        int i = 0;
        int diff = 0;
        while (li.hasPrevious()){
            JButton b = li.previous();
            if (i < l){
                i++;
                b.setBackground(Color.BLUE);
                diff++;
            } else {
                b.setBackground(Color.white);
            }
        }

        diff = diff - liter;
        liter = l;
        return diff;
    }

    /**
     * This method is called from within the constructor to initialize the form.
     * WARNING: Do NOT modify this code. The content of this method is always
     * regenerated by the Form Editor.
     */
    @SuppressWarnings("unchecked")
    // <editor-fold defaultstate="collapsed" desc="Generated Code">//GEN-BEGIN:initComponents
    private void initComponents() {

        setLayout(new java.awt.GridLayout(5, 1));
    }// </editor-fold>//GEN-END:initComponents


    // Variables declaration - do not modify//GEN-BEGIN:variables
    // End of variables declaration//GEN-END:variables
}
