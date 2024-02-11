#include <iostream>

int main(){
    int asd = 10;

    int n[] = {2,3,5,7};

    for(int i=0; i<4; i++){
        asd += n[i];
    }

    std::cout << asd;
}
