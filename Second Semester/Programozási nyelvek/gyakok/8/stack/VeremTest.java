package stack;

import stack.Verem;

import static org.junit.Assert.assertEquals;
import org.junit.Test;

public class VeremTest {
    private static double EPSILON = 0.0000000001;

    @Test
    public void utolsoAzElso(){
        Verem asd = new Verem();
        asd.push(5);
        asd.push(27);
        assertEquals(27, asd.pop(), EPSILON);
    }

    @Test
    public void uresAzUjVerem(){
        Verem asd = new Verem();
        assertEquals(true, asd.empty(), EPSILON);
    }

    @Test
    public void egyElemNemUres(){
        Verem asd = new Verem();
        asd.push(10);
        assertEquals(false, asd.empty(), EPSILON);
    }

    @Test (expected = NoSuchElementException.class)
    public void exceptionTest(){
        Verem asd = new Verem();
        int x = asd.pop();
    }

    @Test
    public void mukodoSize(){
        Verem asd = new Verem();
        assertEquals(0, asd.size(), EPSILON);
        asd.push(2);
        assertEquals(1, asd.size(), EPSILON);
        asd.push(10);
        asd.push(27);
        assertEquals(3, asd.size(), EPSILON);
    }

    @Test
    public void haNincsBenneUres(){
        Verem asd = new Verem();
        asd.push(5);
        int x = asd.pop();
        assertEquals(true, asd.empty(), EPSILON);
    }
}
