import 'package:flutter/material.dart';

var ischecked = [true, false, false];

class MyRadioButton extends StatefulWidget {
  const MyRadioButton({Key? key}) : super(key: key);

  @override
  State<MyRadioButton> createState() => _MyRadioButtonState();
}

class _MyRadioButtonState extends State<MyRadioButton> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,

      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: InkWell(
            onTap: (){
              setState(() {
                ischecked[0]=true;
                ischecked[1]=false;
                ischecked[2]=false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: ischecked[0]?const Color.fromARGB(255, 23, 77, 77):const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color.fromARGB(255, 216, 218, 220),
                  width: 1,
                ),
              ),
              height: 80,
              // width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Medical',
                      style: TextStyle(
                        fontSize: 20,
                        color: ischecked[0]? Colors.white: Colors.black, 
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: ischecked[0]?const Color.fromARGB(255, 23, 77, 77):Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: ischecked[0]? Colors.white: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: InkWell(
            onTap: (){
              setState(() {
                ischecked[1]=true;
                ischecked[0]=false;
                ischecked[2]=false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: ischecked[1]?const Color.fromARGB(255, 23, 77, 77):const Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color.fromARGB(255, 216, 218, 220),
                  width: 1,
                ),
              ),
              height: 80,
              // width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Educational',
                      style: TextStyle(
                        fontSize: 20, 
                        color: ischecked[1]? Colors.white: Colors.black,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: ischecked[1]?const Color.fromARGB(255, 23, 77, 77):Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: ischecked[1]? Colors.white: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 4, horizontal: 16),
          child: InkWell(
            onTap: (){
              setState(() {
                ischecked[0]=false;
                ischecked[2]=true;
                ischecked[1]=false;
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: ischecked[2]?const Color.fromARGB(255, 23, 77, 77):Color.fromARGB(255, 255, 255, 255),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: const Color.fromARGB(255, 216, 218, 220),
                  width: 1,
                ),
              ),
              height: 80,
              // width: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Expanded(
                    flex: 2,
                    child: Text(
                      'Non-Profit',
                      style: TextStyle(
                        fontSize: 20, 
                        color: ischecked[2]? Colors.white: Colors.black,
                      ),
                    ),
                  ),
                  Flexible(
                    child: Container(
                      width: 25,
                      height: 25,
                      decoration: BoxDecoration(
                        color: ischecked[2]?const Color.fromARGB(255, 23, 77, 77):Colors.transparent,
                        borderRadius: BorderRadius.circular(25),
                        border: Border.all(
                          color: ischecked[2]? Colors.white: Colors.black,
                          width: 2,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}