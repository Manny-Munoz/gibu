import "package:flutter/material.dart";

enum Screens { Gibu, Saved, Settings }

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: const SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Text("Main Screen"),
            ],
          ),
        ),
      ),
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            Screens.values[selectedIndex].name,
            style: const TextStyle(
                color: Color.fromARGB(255, 37, 36, 39),
                fontSize: 20,
                fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Image.asset("lib/images/profile icon.png"),
              onPressed: () {},
            ),
          ]),
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.fixed,
          currentIndex: selectedIndex,
          onTap: (int value) {
            setState(() => selectedIndex = value);
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
                label: "Saved"),
          ]),
    );
  }
}
