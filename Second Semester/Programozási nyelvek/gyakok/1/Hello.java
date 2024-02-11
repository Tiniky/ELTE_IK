class Hello {
    public static void main (String[] args){
        
        System.out.println("Mi a neved? ");
        String name = System.console().readLine();
        System.out.println("Hello " + name + "!");
        return;
    }
}
