
import java.awt.BorderLayout;
import java.awt.GridBagLayout;
import java.awt.GridLayout;
import java.awt.event.ActionEvent;
import java.awt.event.ActionListener;
import javax.swing.BoxLayout;
import javax.swing.JButton;
import javax.swing.JFrame;
import javax.swing.JMenu;
import javax.swing.JMenuBar;
import javax.swing.JMenuItem;
import javax.swing.JPanel;
import javax.swing.JTextField;

public class qwertyGUI {
    private JFrame frame;
    private JPanel outPanel;
    private JPanel charsPanel;
    private JTextField result;
    
    public qwertyGUI(){
        frame = new JFrame("Chars");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        
        outPanel = new JPanel();
        outPanel.setLayout(new BoxLayout(outPanel, BoxLayout.Y_AXIS));
        result = new JTextField(100);
        outPanel.add(result);
        
        charsPanel = new JPanel();
        char chars[] = {'q', 'w', 'r', 't', 'y'};
        String res = "";
        charsPanel.setLayout(new GridLayout(1, chars.length));
        for(char c : chars){
            JButton btn = new JButton("" + c);
            btn.addActionListener(new WriteActionListener(c));
            charsPanel.add(btn);
            
            frame.getContentPane().add(BorderLayout.NORTH, outPanel);
            frame.getContentPane().add(BorderLayout.SOUTH, charsPanel);
            
            JMenuBar menu = new JMenuBar();
            frame.setJMenuBar(menu);
            JMenu charsMenu = new JMenu("CHARS");
            menu.add(charsMenu);
            JMenuItem exitMenuItem = new JMenuItem("Exit");
            charsMenu.add(exitMenuItem);
            exitMenuItem.addActionListener(e -> System.exit(0));
            
            frame.pack();
            frame.setVisible(true);
        }
    }
    
    class WriteActionListener implements ActionListener{
        private final char c;
        private String res;
        
        public WriteActionListener(char c){
            this.c = c;
        }

        @Override
        public void actionPerformed(ActionEvent e) {
            switch(c){
                case 'q':
                    res = "q";
                    break;
                case 'w':
                    res = "w";
                    break;
                case 'e':
                    res = "e";
                    break;
                case 'r':
                    res = "r";
                    break;
                case 't':
                    res = "t";
                    break;
                case 'y':
                    res = "y";
                    break;
            }
            result.setText(result.getText() + res);
        }
    }
}
