#include "PrQ.hpp"

int PrQueue::MaxIndex() const
{
    int ind = 0;
    int maxPr = vec[0].pr;

    for(int i=1; i<vec.size(); i++)
    {
        if(vec[i].pr > maxPr)
        {
            maxPr = vec[i].pr;
            ind = i;
        }
    }

    return ind;
}

void PrQueue::setEmpty()
{

}

bool PrQueue::isEmpty()
{
    return vec.size() == 0;
}

void PrQueue::add(comst Item &i)
{
    vec.push_back(i);
}

Item PrQueue::getMax() const
{
    int i = MaxIndex();
    return vec[i];
}

Item PrQueue::remMax()
{
    int i = MaxIndex();

    Item temp = vec[i];

    vec[i] = vec[vec.size()-1];
    vec.pop_back();

    return temp;
}
