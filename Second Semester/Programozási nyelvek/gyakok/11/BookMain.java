public class BookMain {
    public static void main(String[] args) {
        Book b1 = new Book("J.R.R.Tolkien", "A hobbit", 450);
        Book b2 = new Book();

        System.out.println(b1.toString());
        System.out.println(b2.toString());

        PrintedBook pb1 = new PrintedBook("Stephen King", "Ragyogás", 370, PrintedBook.Cover.Softcover);
        PrintedBook pb2 = new PrintedBook();

        System.out.println(pb1.getShortName() + " " + pb1.getPrice());
        System.out.println(pb2.getShortName() + " " + pb2.getPrice());

        EBook eb = new EBook("Sarah J. Maas", "Üvegtrón", 520, 75);
        System.out.println(eb.getShortName() + " " + eb.getPrice());

        System.out.println(b1.createReference("Tolkien fantasy elmélete", 2, 7));
        System.out.println(pb1.createReference("Horror vagy Dark Fantasy", 25, 27));
        System.out.println(eb.createReference("Női főhős nanii", "2022.04.05"));
        System.out.println(eb.createReference("asd", 66, 70));
    }
}
