public class Id {
    private int id;
    private static int id_cnt;

    public Id(){
        this.id = ++id_cnt;
    }
}
