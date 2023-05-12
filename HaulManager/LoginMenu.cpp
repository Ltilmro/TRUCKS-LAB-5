#include "LoginMenu.h"
LoginMenu::LoginMenu() {
	this->login = "";
	this->role = "";
}
void LoginMenu::logIn(std::ostream& os, std::istream& is) {
	std::string l;
	std::string p;
	while (true)
	{
		os << "Enter Login\n";
		l = "";
		is >> l;
		if (l == "0")
			break;
		//if (inTable(l))
		{
			p = "";
			os << "Enter Password\n";
			is >> p;
			//if (passwordCorrect())
			{
				this->login = l;
				//this->role = role();
				this->role = "user";//temp
				os << "Welcome, " << this->login << "\n";
				break;
			}

		}
		{
			os << "Wrong login or password\n";
			os << "Try again\n";
			os << "Or type 0 to abort\n";
		}
	}
}
std::string LoginMenu::getLogin() {
	return this->login;
}
std::string LoginMenu::getRole() {
	return this->role;
}