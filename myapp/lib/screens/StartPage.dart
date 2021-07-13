import 'package:flutter/material.dart';
import "LoginPage.dart";

void main() {
  runApp(start());
}

class start extends StatefulWidget {
  const start({Key? key}) : super(key: key);

  @override
  _startState createState() => _startState();
}

class _startState extends State<start> {
  bool buttonChange = false;
  @override
  Widget build(BuildContext context) {
    return Material(
        child: SingleChildScrollView(
            child: Column(
      children: [
        Image.asset("assets/images/welcome.png"),
        Divider(color: Colors.green, thickness: 5),
        SizedBox(height: 350),
        InkWell(
            child: AnimatedContainer(
              duration: Duration(seconds: 1),
              height: 90,
              width: buttonChange ? 90 : 250,
              child: Center(
                child: buttonChange?Icon(Icons.done):Text("Lets Go....",
                    style: TextStyle(
                      fontSize: 25,
                      fontWeight: FontWeight.bold,
                    )),
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50.0),
                color: Colors.green,
              ),
            ),
            onTap: () async {
              setState(() {
                buttonChange = true;
              });
              await Future.delayed(Duration(seconds: 1));

               await Navigator.push(
                  context, MaterialPageRoute(builder: (context) => login()));
              buttonChange = false;
              setState(() {
                
              });
            })
      ],
    ))
        // ElevatedButton(
        //     child: Text("Click here ......",
        //         style: TextStyle(color: Colors.white,fontSize: 20)),
        //     onPressed: () {
        //       Navigator.push(
        //           context, MaterialPageRoute(builder: (context) => login()));
        //     },
        //     style: ElevatedButton.styleFrom(minimumSize: Size(200.0, 60.0)),)
        );
  }
}
