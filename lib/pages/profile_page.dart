import "package:flutter/material.dart";
import 'package:gibu/components/profile_component.dart';
import "package:gibu/components/complete_divider.dart";

class Profile extends StatelessWidget {
  const Profile ({super.key});

  @override
Widget build(BuildContext context){
  return Material(
    child: Container(
      color: Colors.white,
      child: SafeArea(child: SingleChildScrollView(
        child: Column( children: [
    const ProfileStrcture(imageProfile: "lib/images/profile (2).png", username: "Monika Islam", email: "monikaislam123@gmail.com"),
    const SizedBox(height: 20),
    Row(
       children: [
              const SizedBox(width: 40),
              Image.asset("lib/images/impact.png"),
              const SizedBox(width: 10,),
              const Text("Impact on people's life", style: TextStyle(fontSize: 20),),
            ],  
          ),
          const CompleteDivider(),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 40),
              Image.asset("lib/images/share.png"),
              const SizedBox(width: 15),
              const Text("Share with friends", style: TextStyle(fontSize: 20)),
            ],
          ),
          const CompleteDivider(),
          const SizedBox(height: 10),
          Row(
            children: [
              const SizedBox(width: 40),
              Image.asset("lib/images/experience.png"),
              const SizedBox(width: 15),
              const Text("User's experience", style: TextStyle(fontSize: 20)),]),
          const CompleteDivider(),
          const SizedBox(height: 10),
              Row(
                children: [
                  const SizedBox(width: 40),
                  Image.asset("lib/images/campaign.png"),
                  const SizedBox(width: 15),
                  const Text("My campaigns", style: TextStyle(fontSize: 20)),
                ],
              ),
              const CompleteDivider(),
              ],
    )
    
))));}

  }