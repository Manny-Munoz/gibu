import "package:flutter/material.dart";
import "package:gibu/pages/home_page.dart";
import "package:gibu/pages/public_campaing.dart";
import "package:gibu/pages/settings_page.dart";

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;
  final screenNames = ["Gibu", "Saved", "Settings"];
  final pageController = PageController();

  final screens = [HomePage(), const PublicCampaing(), const SettingsPage()];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: PageView(
        controller: pageController,
        onPageChanged: (index) {
          setState(() => selectedIndex = index);
        },
        children: screens,
      ), 
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            screenNames[selectedIndex],
            style: const TextStyle(
                color: Color.fromARGB(255, 37, 36, 39),
                fontSize: 30,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Image.asset("lib/images/profile icon.png"),
              onPressed: () {
                Navigator.pushNamed(context, "/profile");
              },
            ),
          ]),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (int value) {
            setState(() => selectedIndex = value);
            pageController.jumpToPage(value);
          },
          elevation: 0,
          items: [
            BottomNavigationBarItem(
                icon: Image.asset("lib/images/home icon.png"),
                activeIcon: Image.asset("lib/images/home icon active.png"),
                label: "Home"),
            BottomNavigationBarItem(
                icon: Image.asset("lib/images/saved icon.png"),
                activeIcon: Image.asset("lib/images/saved icon active.png"),
                label: "Saved"),
            BottomNavigationBarItem(
                icon: Image.asset("lib/images/settings icon.png"),
                activeIcon: Image.asset("lib/images/settings icon active.png"),
                label: "Settings"),
          ]),
    );
  }
}
