package basics;

public class Matrix {
    private int sor, oszlop;
    private int[][] mat;

    public Matrix(int n, int m){
        this.sor = n;
        this.oszlop = m;
        this.mat = new int[n][m];
    }

    public static Matrix nullMatrix(int n, int m){
        Matrix x = new Matrix(n, m);
        for(int i=0; i<x.sor; i++){
            for(int j=0; j<x.oszlop; j++){
                x.mat[i][j] = 0;
            }
        }
        return x;
    }

    public Matrix normalMatrix(int[] sorfolytonos){
        Matrix x = new Matrix(this.sor, this.oszlop);
        int a = 0;
        for(int i=0; i<x.sor; i++){
            for(int j=0; j<x.oszlop; j++){
                x.mat[i][j] = sorfolytonos[a];
                a++;
            }
        }
        return x;
    }

    public static Matrix egysegMatrix(int n){
        Matrix x = Matrix.nullMatrix(n, n);
        for(int i=0; i<x.sor; i++){
            x.mat[i][i] = 1;
        }
        return x;
    }

    public Matrix transzponal(){
        Matrix x = new Matrix(this.sor, this.oszlop);
        for(int i=0; i<x.sor; i++){
            for(int j=0; j<x.oszlop; j++){
                x.mat[j][i] = this.mat[i][j];
            }
        }
        return x;
    }

    public Matrix osszead(Matrix y){
        if(y.sor != this.sor || y.oszlop != this.oszlop){
            throw new IllegalArgumentException("ezt a két mátrixot nem lehet összeadni");
        }

        Matrix x = new Matrix(this.sor, this.oszlop);
        for(int i=0; i<x.sor; i++){
            for(int j=0; j<x.oszlop; j++){
                x.mat[i][j] = this.mat[i][j] + y.mat[i][j];
            }
        }
        return x;

    }

    public Matrix kivon(Matrix y){
        if(y.sor != this.sor || y.oszlop != this.oszlop){
            throw new IllegalArgumentException("ezt a két mátrixot nem lehet kivonni");
        }

        Matrix x = new Matrix(this.sor, this.oszlop);
        for(int i=0; i<x.sor; i++){
            for(int j=0; j<x.oszlop; j++){
                x.mat[i][j] = this.mat[i][j] - y.mat[i][j];
            }
        }
        return x;
    }

    public String toString(){
        StringBuilder s = new StringBuilder();
        s.append("{");
        for(int i=0; i<this.sor; i++){
            for(int j=0; j<this.oszlop; j++){
                if(j == this.oszlop - 1){
                    if(i == this.sor - 1){
                        s.append(this.mat[i][j]).append("}");
                    } else{
                    s.append(this.mat[i][j]).append(";");
                    }
                } else{
                    s.append(this.mat[i][j]).append(",");
                }
            }
        }
        return s.toString();
    }
}
