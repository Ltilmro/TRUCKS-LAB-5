#include "HaulManager.h"
#include "UserMenu.h"
#include "LoginMenu.h"
#include "AdminMenu.h"
	void HaulManager::start(std::ostream& os, std::istream& is) 
	{
		LoginMenu login = LoginMenu();
		login.logIn(os,is);
			if (login.getRole() == "user")
			{
				UserMenu menu = UserMenu();
				menu.runMenu(os, is,login);
			}
			else if (login.getRole()=="admin")
			{
				AdminMenu menu = AdminMenu();
				menu.runMenu(os, is);
			}
	}