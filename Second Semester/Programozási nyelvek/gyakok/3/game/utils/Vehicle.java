package game.utils;

public class Vehicle {
    private int modelId, color1, color2;
    private String numPlate;
    
    public void setModelId(int n){
        this.modelId = n;
    }

    public void setNumPlate(String s){
        this.numPlate = s;
    }

    public void setColor1(int n){
        this.color1 = n;
    }

    public void setColor2(int n){
        this.color2 = n;
    }

    public int getModelId(){
        return this.modelId;
    }

    public String getNumPlate(){
        return this.numPlate;
    }

    public int getColor1(){
        return this.color1;
    }

    public int getColor2(){
        return this.color2;
    }

}
