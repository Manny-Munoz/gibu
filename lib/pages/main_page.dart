import "package:flutter/material.dart";

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
      bottomNavigationBar: BottomNavigationBar(
          type: BottomNavigationBarType.shifting,
          currentIndex: selectedIndex,
          onTap: (int value) {
            setState(() => selectedIndex = value);
          },
          elevation: 0,
          items: [
            const BottomNavigationBarItem(
                backgroundColor: Colors.green,
                icon: Icon(Icons.home),
                activeIcon: Icon(Icons.home),
                label: "Home"),
            const BottomNavigationBarItem(
                backgroundColor: Colors.black,
                icon: Icon(Icons.home),
                activeIcon: Icon(Icons.home),
                label: "Saved"),
            BottomNavigationBarItem(
                    backgroundColor: Colors.pink,
                  icon: const Icon(Icons.home),
                  activeIcon: Image.asset("lib/images/logo isotipo.png"),
                  label: "Saved"),
          ]),
    );
  }
}
