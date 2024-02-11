#include "meret.h"
Kicsi* Kicsi::_instance = nullptr;
Nagy* Nagy::_instance = nullptr;
Kozepes* Kozepes::_instance=nullptr;

Meret* Meret::Atalakit(string s)
{
    if(s=="kicsi")
    {
        return Kicsi::instance();
    }
    else if(s=="kozepes")
    {
        return Kozepes::instance();
    }
    else{
        return Nagy::instance();

    }
    

}