#include "AdminMenu.h"
void AdminMenu::runMenu(std::ostream& os, std::istream& is)
{
	std::string moption = "";
	//QueryProcessor q = QueryProcessor();
	//os << q.help;
	while (true) {
		moption = "";
		is >> moption;
		if (moption == "1")
		{
			os << "1 for help, 2 for haul list, 3 for vehicle data\n";
			os << "4 for driver data, 5 for min hauls, 6 for max mileage, 0 to quit\n";
			//os<<q.help();
		}
		else if (moption == "2")
		{
			//std::string d;
			//os<<"Enter driver ID\n";
			//is>>d;
			//os<<"Enter time frame\n";
			//input time
			//os<<q.haulList(d,time);
		}
		else if (moption == "3")
		{
			//std::string v;
			//os<<"Enter vehicle ID\n";
			//is>>v;
			//os<<q.vehicleData(v);
		}
		else if (moption == "4")
		{
			//os<<q.driverData();
		}
		else if (moption == "5")
		{
			//os<<q.minHauls();
		}
		else if (moption == "6")
		{
			//os<<q.maxMileage();
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
