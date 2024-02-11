#include <iostream>
#include "PrQ.hpp"

//#define NORMAL_MODE
#ifdef NORMAL_MODE

int main()
{
    return 0;
}
#else
#define CATCH_CONFIG_MAIN
#include "catch.hpp"

TEST_CASE("isEmpty")
{
    PrQueue Q1;
    CHECK(Q1.isEmpty() == true);
}

#endif
