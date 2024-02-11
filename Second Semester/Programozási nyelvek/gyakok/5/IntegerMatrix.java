public class IntegerMatrix {
    int rowNum, colNum;
    int[] linearData;

    public IntegerMatrix(int r, int c, int[] list){
        this.rowNum = r;
        this.colNum = c;
        this.linearData = list;     //nem optimális !!pointer
    }

    public String toString(){
        StringBuilder s = new StringBuilder();

        for(int i=0; i<this.linearData.length; i++){
            if(i==this.linearData.length-1){
                s.append(this.linearData[i]);
            }
            else if(i==rowNum || (i>rowNum && i%rowNum==0) && i != 0){
                s.append(this.linearData[i]).append("; ");
            }
            else{
                s.append(this.linearData[i]).append(", ");
            }
        }

        return s.toString();
    }

    public static void main(String[] args){
        int[] linearData = {1,2,3,4,5,6};
        IntegerMatrix intmatrix = new IntegerMatrix(2, 3, linearData);
        System.out.print(intmatrix.toString());
    }
}