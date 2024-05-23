import 'package:flutter/material.dart';

class CampaignList extends StatelessWidget {
  final String campaingName;
  const CampaignList({
    super.key,
    required this.campaingName,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      child: ListView(
        shrinkWrap: true,
        children: <Widget>[
          ListTile(
            leading: const Icon(Icons.arrow_forward_ios),
            title: Text(campaingName),
          ),
          ListTile(
            leading: const Icon(Icons.arrow_forward_ios),
            title: Text(campaingName),
          ),
        ],
      ),
    );
  }
}
