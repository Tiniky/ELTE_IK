public class Complex {
    public double re, im;

    public double abs(Complex c){
        return Math.sqrt(c.re*c.re + c.im*c.im);
    }

    public void add(Complex c){
        this.re += c.re;
        this.im += c.im;
    }

    public void sub(Complex c){
        this.re -= c.re;
        this.im -= c.im;
    }

    public void mul(Complex c){
        this.re = this.re*c.re - this.im*c.im;
        this.im = this.re*c.im + this.im*c.re;
    }

    public static void main(String[] args){
        Complex alpha = new Complex();
        Complex beta = new Complex();

        alpha.re = 3;
        alpha.im = 2;
        beta.re = 1;
        beta.im = 2;

        alpha.add(beta);
        System.out.println(alpha.re + " + " + alpha.im + "*i");

        alpha.mul(beta);
        System.out.println(alpha.re + " + " + alpha.im + "*i");

        alpha.sub(beta);
        System.out.println(alpha.re + " + " + alpha.im + "*i");
    }
}
