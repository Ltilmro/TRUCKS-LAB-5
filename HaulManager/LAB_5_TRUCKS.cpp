
#include <iostream>
#include "HaulManager.h"

int main()
{
	HaulManager haul = HaulManager();
	haul.start(std::cout, std::cin);
}

