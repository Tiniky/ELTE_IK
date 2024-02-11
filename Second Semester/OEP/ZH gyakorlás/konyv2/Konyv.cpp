#include "konyv.h"
 int Konyv::Dij(int ma)
        {
            int keses= ma -(fej->get_datum() + 30);
            if(keses>0)
            {
                return keses*mufaj->Dij();
            }
            return 0;
        }

Konyv:: ~Konyv(){
    delete mufaj;
}