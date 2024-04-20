import 'package:flutter/material.dart';

class TextDivider extends StatelessWidget{
  final Color color;
  final double thickness;
  const TextDivider({super.key, this.color= Colors.black, this.thickness= 0.5});

@override
Widget build(BuildContext context){
  return Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: thickness,
                        color: color,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text(
                        'Or Login with',
                        style: TextStyle(color: Colors.grey[700]),
                      ),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 0.5,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              );
}

}