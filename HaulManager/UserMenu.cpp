#include "UserMenu.h"
void UserMenu::runMenu(std::ostream& os,std::istream& is,LoginMenu l)
{
	std::string moption="";
	//QueryProcessor q = QueryProcessor();
	//os << q.help;
	while (true) {
		moption = "";
		is >> moption;
		if (moption == "1")
		{
			os << "1 for help, 2 for haul list, 3 for vehicle data\n";
			os << "4 for driver data, 5 for max mileage, 0 to quit\n";
			//os<<q.help();
		}
		else if (moption == "2")
		{
			//os<<"Enter time frame\n";
			//input time
			//os<<q.haulList(l,time);
		}
		else if (moption == "3")
		{
			//std::string v;
			//os<<"Enter vehicle ID\n";
			//is>>v;
			//os<<q.vehicleData(l,v);
		}
		else if (moption == "4")
		{
			//os<<q.driverData(l);
		}
		else if (moption == "5")
		{
			//os<<q.maxMileage(l);
		}
		else if (moption == "0")
		{
			os << "Exiting\n";
			break;
		}
		else
		{
			os << "You dumb? 1 for help, 0 to GTFO\n";
		}
	} 
	
}
