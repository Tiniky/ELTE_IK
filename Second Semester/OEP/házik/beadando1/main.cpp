#include <iostream>
#include "Complex.h"

using namespace std;

void menu()
{
    cout << endl << endl;

    for(int i=0; i< 15; i++)
    {
        cout << "-";
    }
    cout << endl;

    cout << "(1) OSSZEADAS |" << endl;
    cout << "(2) KIVONAS   |" << endl;
    cout << "(3) SZORZAS   |" << endl;
    cout << "(4) OSZTAS    |" << endl;
    cout << "(5) EXIT      |" << endl;

    for(int i=0; i< 15; i++)
    {
        cout << "-";
    }
    cout << endl << endl << endl;

    cout << "A valasztott menupont: ";
}

Complex beker1()
{
    double x, y;
    cout << "Add meg az elso szam valos reszet: ";
    cin >> x;
    cout << "Add meg az elso szam imaginarius reszet: ";
    cin >> y;

    return Complex(x,y);
}

Complex beker2()
{
    double x, y;
    cout << "Add meg az elso szam valos reszet: ";
    cin >> x;
    cout << "Add meg az elso szam imaginarius reszet: ";
    cin >> y;

    return Complex(x,y);
}

int main()
{

    cout << "Helloo, ez itt a MATRIX KALKULATOR 2000. Valassz az alabbi opciok kozul es megkonnyitem az eleted:";

    while(true)
    {
        menu();

        int opcio;
        cin >> opcio;

        cout << endl;

        if(opcio == 1)
        {
            Complex a = beker1();
            Complex b = beker2();
            Complex c(0,0);

            c = a + b;
            cout << a << " + " << b << " = " << c << endl;
        }

        else if(opcio == 2)
        {
            Complex a = beker1();
            Complex b = beker2();
            Complex c(0,0);

            c = a - b;
            cout << a << " - " << b << " = " << c << endl;
        }

        else if(opcio == 3)
        {
            Complex a = beker1();
            Complex b = beker2();
            Complex c(0,0);

            c = a * b;
            cout << a << " * " << b << " = " << c << endl;
        }

        else if(opcio == 4)
        {
            Complex a = beker1();
            Complex b = beker2();
            Complex c(0,0);

            bool nulla = false;

            try
            {
                c = a / b;
            }
            catch(NullDivision)
            {
                nulla = true;
            }

            if(!nulla)
            {
                c = a / b;
                cout << a << " / " << b << " = " << c << endl;
            }
            else
            {
                cout << "Nullaval osztani nem fun :c" << endl;
            }
        }

        else if(opcio == 5)
        {
            cout << "see ya" << endl;
            break;
        }

        else
        {
            cout << "Oops ez az opcio nem elerheto, valassz egy masikat" << endl;
        }
    }
}
