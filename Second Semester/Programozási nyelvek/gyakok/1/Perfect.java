class Perfect {
    public static void main(String[] args)
    {
        int num = 0;
        if(args.length > 0)
        {
            num = Integer.parseInt(args[0]);
        } 
        else 
        {
            System.out.print("Give me a number: ");
            num = Integer.parseInt(System.console().readLine());
        }

        int db = 0;
        for(int i=1; i<=num; i++)
        {
            int osztoOsszeg = 0;
            int osztoDB = 0;

            for(int j=1; j<=i-1; j++)
            {
                if(i%j == 0)
                {
                    osztoOsszeg += j;
                    osztoDB++;
                }
            }

            if(osztoOsszeg == i && osztoDB > 1)
            {
                db++;
            }
        }

        if(db == 0)
        {
            System.out.println("No perfect numbers here!");
        }
        else
        {
            System.out.println("Perfect number(s) found! Exactly this many: " + db);
        }

    }
}
