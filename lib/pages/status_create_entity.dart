import 'package:flutter/material.dart';
import "package:gibu/pages/request_status_page.dart";

class StatusCreateEntity extends StatelessWidget {
  final String path;
  final String text;
  final String title;
  const StatusCreateEntity(
      {super.key, required this.path, required this.title, required this.text});

  @override
  Widget build(BuildContext context) {
    return RequestStatusPage(
      title: title,
      text: text,
      path: path,
      imagePath: "lib/images/check.png",
    );
  }
}
