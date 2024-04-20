import "package:flutter/material.dart";
import "package:gibu/pages/request_status_page.dart";

class StatusPasswordChange extends StatelessWidget {
  const StatusPasswordChange({super.key});
  final String text =
      true ? "Password changed successfully" : "Password change failed";
  final String imagePath =
      true ? "lib/images/logo.png" : "lib/images/logo.png";
  final String path = true ? "Login" : "Error Ocurred";
  final String title = true ? "Password changed" : "Error ocurred";

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
