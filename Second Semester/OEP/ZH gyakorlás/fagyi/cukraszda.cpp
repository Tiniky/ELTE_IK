#include "cukraszda.h"

void Cukraszda::Nyit(Fagyizo* u){
        for(Fagyizo* e : uzletek)
        {
            if(e->get_cim()==u->get_cim())
            {
                throw exception();
            }
        }
        uzletek.push_back(u);
        
    }