import 'package:flutter/material.dart';
import 'package:gibu/components/button.dart';
import 'package:gibu/components/input_text.dart';
import 'package:gibu/components/text_alignment_left.dart';

class ChangePassword extends StatelessWidget{
  ChangePassword({super.key});
  final newpasswordcontroller = TextEditingController();
  final confirmpasswordcontroller = TextEditingController();

@override
Widget build(BuildContext context){
  return Scaffold(
    backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
                        const SizedBox(height: 25),

              Padding(
              padding: const EdgeInsets.symmetric(horizontal: 40.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Image.asset("lib/images/logo isotipo.png"),
                ],
              )),
          const SizedBox(height: 50),
              const TextAlignmentLeft(text: "Change password", textSize: 32,),
              const SizedBox(height: 5),
              const TextAlignmentLeft(text: "Please type something you'll remember", textSize: 14, textColor: Color.fromARGB(255, 88, 88, 88),),
              const SizedBox(height: 20),
              const TextAlignmentLeft(text: "New password"),
              const SizedBox(height: 9),
              InputText(controller: newpasswordcontroller, hintText: "Must be 8 characters", obscureText: false),
              const SizedBox(height: 15),
              const TextAlignmentLeft(text: "Confirm new password"),
              const SizedBox(height: 9),
              InputText(controller: confirmpasswordcontroller, hintText: "Confirm password", obscureText: false),
              const SizedBox(height: 50),
              const Button(text: "Change password"),
            ],))
        )
  );
}

}