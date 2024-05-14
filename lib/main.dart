import 'package:flutter/material.dart';
<<<<<<< Updated upstream
=======
import 'package:gibu/pages/main_page.dart';
import 'package:gibu/pages/step_two_campaing.dart';
>>>>>>> Stashed changes
import 'package:gibu/pages/welcome_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
<<<<<<< Updated upstream
      home: WelcomePage(),
=======
      home: StepTwoCampaing(),
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/login': (context) => LoginPage(),
        '/createAccountPage': (context) => CreateAccountPage(),
        '/main': (context) => const MainPage(),
      },
>>>>>>> Stashed changes
    );
  }
}
