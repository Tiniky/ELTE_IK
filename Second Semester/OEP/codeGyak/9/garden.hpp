# pragma once

#include <vector>
#include "parcel.hpp"

class Garden{
private:
    std::vector<Parcel*> parcels;

public:
    Garden(int n){
        if(n>=1){
            parcels.resize(n);

            for(int i=0; i<n; i++){
                parcels[i] = new Parcel();
            }
        }
    }

    std::vector<int> canHarvest(int date){
        std::vector<int> result;

        for(int i=0; i<parcels.size(); i++){
            if(parcels[i]->isRipe(date)){
                result.push_back(i);
            }
        }
        return result;
    }

    Parcel* getParcel(int i) const{
        return parcels[i];
    }

    ~Garden(){
        for(Parcel* p: parcels){
            delete p;
        }
    }
};
