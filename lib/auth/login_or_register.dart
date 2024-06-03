import "package:flutter/material.dart";
import "package:gibu/pages/welcome_page.dart";
import "package:gibu/pages/create_account_page.dart";
import "package:gibu/pages/login_page.dart";

class LogInOrRegister extends StatefulWidget {
  const LogInOrRegister({super.key});

  @override
  State<LogInOrRegister> createState() => _LogInOrRegisterState();
}

class _LogInOrRegisterState extends State<LogInOrRegister> {
  bool showWelcomePage = true;
  bool showLoginPage = true;

  void toggleViewToLogin() {
    setState(() {
      showWelcomePage = false;
      showLoginPage = true;
    });
  }

  void toggleViewToRegister() {
    setState(() {
      showWelcomePage = false;
      showLoginPage = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    if (showWelcomePage) {
      return WelcomePage(
          onLoginTap: toggleViewToLogin, onRegisterTap: toggleViewToRegister);
    } else if (showLoginPage) {
      return LoginPage(onTap: toggleViewToRegister);
    } else {
      return CreateAccountPage(onTap: toggleViewToLogin);
    }
  }
}
