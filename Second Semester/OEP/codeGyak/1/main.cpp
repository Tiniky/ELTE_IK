#include <iostream>
#include "Point.h"
#include "Circle.h"

using namespace std;

int main()
{
    Point p(10,27);
    Point p2(1,2);

    Circle c(p,15);
    cout << c.tartalmaz(p2) << endl;
    return 0;
}
