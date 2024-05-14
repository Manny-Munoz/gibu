import 'package:flutter/material.dart';

class CompleteDivider extends StatelessWidget {
  const CompleteDivider({super.key});

  @override
  Widget build(BuildContext context){
    return const Material(
        child: Column( 
          children:[
            Divider(
              thickness: 1,
              color: Colors.black,
              indent: 40,
              endIndent: 40,   
        )]
            ),
      );
  }}