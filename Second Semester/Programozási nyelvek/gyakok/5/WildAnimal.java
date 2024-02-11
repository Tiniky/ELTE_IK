public enum WildAnimal{
    RACOON("trash", 40),
    ELEPHANT("nuts", 30000),
    MONKEY("banana", 1027),
    GIRAFFE("leaves", 123456);

    private final String food;
    private final int amount;

    WildAnimal(String food, int amount){
        this.food = food;
        this.amount = amount;
    }

    public static String listAllAnimal(){
        StringBuilder sb = new StringBuilder();

        for(WildAnimal anim : WildAnimal.values()){
            sb.append(anim.ordinal()).append(": the").append(anim.toString()).append(" likes to eat ").append(anim.food).append(anim.amount).append(" times a week.\n");
        }

        return sb.toString();
    }

    @Override
    public String toString(){
        switch(this){
            case MONKEY: return "monkey";
            case GIRAFFE: return "giraffe";
            case ELEPHANT: return "elephant";
            case RACOON: return "racoon";
            default: return "animal";
        }
    }
}