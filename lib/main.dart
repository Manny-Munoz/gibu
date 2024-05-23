import 'package:flutter/material.dart';
import 'package:gibu/pages/donation_form.dart';
import 'package:gibu/pages/start_campaign_page.dart';
import 'package:gibu/pages/main_page.dart';
import 'package:gibu/pages/fill_out_campaign.dart';
import 'package:gibu/pages/welcome_page.dart';
import 'package:gibu/pages/login_page.dart';
import 'package:gibu/pages/create_account_page.dart';
import 'package:gibu/pages/profile_page.dart';
import 'firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:gibu/auth/auth.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const AuthPage(),
      routes: {
        '/login': (context) => const LoginPage(),
        '/profile': (context) => const Profile(),
        '/main': (context) => const MainPage(),
        '/startCampaign': (context) => const StartCampaignPage(),
        '/fillOutCampaign': (context) => FillOutCampaign(),
        '/donationForm': (context) => const DonationForm(),
      },
    );
  }
}
