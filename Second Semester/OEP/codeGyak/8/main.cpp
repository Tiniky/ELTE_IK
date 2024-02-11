#include "Costumer.hpp"
#include "Store.hpp"

using namespace std;

int main()
{

    Costumer c("costumer.txt");
    Store s("food.txt", "technical.txt");

    c.goShopping(s);

    return 0;
}
