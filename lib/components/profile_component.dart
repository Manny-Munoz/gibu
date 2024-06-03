import 'package:flutter/material.dart';

class ProfileStrcture extends StatelessWidget {
  final String imageProfile;
  final String username;
  final String email;
  const ProfileStrcture(
      {super.key,
      required this.imageProfile,
      required this.username,
      required this.email});

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.white,
      child: Column(
        children: [
          const SizedBox(height: 10),
          CircleAvatar(
            radius: 60,
            backgroundImage:
                imageProfile != "" ? NetworkImage(imageProfile) : null,
            child: imageProfile == ""
                ? const Icon(Icons.account_circle, size: 100)
                : null,
          ),
          const SizedBox(height: 5),
          Text(username, style: const TextStyle(fontSize: 28)),
          Text(email,
              style: const TextStyle(
                  fontSize: 15, color: Color.fromARGB(255, 146, 144, 144))),
        ],
      ),
    );
  }
}
