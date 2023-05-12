#pragma once
#include <string>
#include <iostream>
class LoginMenu
{
private: 
	std::string login;
	std::string role;
public:
	LoginMenu();
	void logIn(std::ostream& os, std::istream& is);
	std::string getLogin();
	std::string getRole();
};

