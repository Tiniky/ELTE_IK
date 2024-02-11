import basics.Matrix;

public class Main{
    public static void main(String[] args) {
        Matrix m1 = Matrix.nullMatrix(3, 2);
        Matrix m = new Matrix(3, 3);
        int[] sor = {7,5,6,2,8,9,4,6,3};
        Matrix m2 = m.normalMatrix(sor);
        Matrix m3 = Matrix.egysegMatrix(3);

        System.out.println("ez egy nullmátrix: " + m1.toString());
        System.out.println("ez egység mátrix: " + m3.toString());
        System.out.println("ez egy átlagos mátrix: " + m2.toString());

        Matrix osszeg;
        try {
            m1.osszead(m2);
        } catch (IllegalArgumentException x) {
            System.out.println("error: nem azonos a két mátrix mérete");
        }

        try {
            m2.osszead(m3);
        } catch (IllegalArgumentException x) {
            System.out.println("nem azonos a két mátrix mérete");
        } finally{
            osszeg = m2.osszead(m3);
        }
        

        System.out.println("a két azonos méretű mátrix összege: " + osszeg.toString());

        Matrix t = m2.transzponal();
        System.out.println("az átlagos mátrix transzponáltja: " + t.toString());

        Matrix kivon;
        try {
            m2.kivon(m1);
        } catch (IllegalArgumentException x) {
            System.out.println("error: nem azonos a két mátrix mérete");
        }

        try {
            m2.kivon(m3);
        } catch (IllegalArgumentException x) {
            System.out.println("nem azonos a két mátrix mérete");
        } finally{
            kivon = m2.kivon(m3);
        }

        System.out.println("a két azonos méretű mátrix kivonása után kapjuk: " + kivon.toString());
    }
}