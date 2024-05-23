import 'package:flutter/material.dart';
import "package:gibu/pages/request_status_page.dart";

class StatusCreateEntity extends StatelessWidget {
  const StatusCreateEntity({super.key});
  // Insert a message for the user when the entity is created successfully for example "Your campaign has been created succesfully.\n our team will review it and get back to you shortly."
  final String text = true ? "Campaign created successfully" : "Password change failed";
  final String imagePath =
      true ? "lib/images/check.png" : "lib/images/check.png";
  final String path = "home";
  final String title = true ? "Campaign Created" : "Error ocurred";

  @override
  Widget build(BuildContext context) {
    return RequestStatusPage(
      title: title,
      text: text,
      path: path,
      imagePath: imagePath,
    );
  }
}
