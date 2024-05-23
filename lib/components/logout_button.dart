import 'package:flutter/material.dart';

class LogoutButton extends StatelessWidget{
  const LogoutButton({super.key});

  @override
  Widget build(BuildContext context){
    return FloatingActionButton(
      onPressed: () => showDialog<String>(
        context: context,
        builder: (BuildContext context) => AlertDialog(
          surfaceTintColor: Colors.white,
          title: const Text('Logout'),
          content: const Text('Are you sure you want to logout?', style: TextStyle(fontSize: 15),),
          actions: <Widget>[
            TextButton(
              onPressed: () => Navigator.pop(context, 'Cancel'),
              child: const Text('Cancel', style: TextStyle(color: Color.fromARGB(255, 23, 77, 77))),
            ),
            TextButton(
              onPressed: () => Navigator.pop(context, 'Logout'),
              child: const Text('Logout', style: TextStyle (color: Color.fromARGB(255, 23, 77, 77))),
            ),
          ],
        ),
      ).then((value) {
        if (value == 'Logout') {
          Navigator.pushNamed(context, '/login');
        }
      }),
      shape: const CircleBorder(),
      backgroundColor: const Color.fromARGB(255, 23, 77, 77),
      child: const Icon(Icons.logout_rounded, color: Colors.white,),);
  }

}