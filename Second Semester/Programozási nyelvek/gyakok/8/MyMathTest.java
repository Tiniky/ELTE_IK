import static org.junit.Assert.assertEquals;

import java.beans.Transient;
import java.lang.annotation.Target;

import static MyMath.power;
import org.junit.Test;

public class MyMathTest {

    private static double EPSILON = 0.000001;
    
    @Test
    public void twoToTheSecond(){
        assertEquals(4, MyMath.power(2, 2), EPSILON);
    }

    @Test
    public void twoToTheZeroth(){
        assertEquals(1, MyMath.power(2, 0), EPSILON);
    }

    /*@Test(expected = IllegalArgumentException.class)
    public void exceptionTest(){
        MyMath.power(0, -10);
    }*/

    @Test
    public void twoToTheMinusSecond(){
        assertEquals(1/4, MyMath.power(2,-2), EPSILON);
    }
}
