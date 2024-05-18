import 'package:flutter/material.dart';
import 'package:gibu/pages/start_campaign_page.dart';
import 'package:gibu/pages/main_page.dart';
import 'package:gibu/pages/fill_out_campaign.dart';
import 'package:gibu/pages/welcome_page.dart';
import 'package:gibu/pages/login_page.dart';
import 'package:gibu/pages/create_account_page.dart';
import 'package:gibu/pages/profile_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const WelcomePage(),
      routes: {
        '/welcome': (context) => const WelcomePage(),
        '/login': (context) => const LoginPage(),
        '/createAccountPage': (context) => const CreateAccountPage(),
        '/profile': (context) => const Profile(),
        '/main': (context) => const MainPage(),
        '/startCampaign': (context) => const StartCampaignPage(),
        '/fillOutCampaign': (context) => FillOutCampaign(),
      },
    );
  }
}
