import 'package:flutter/material.dart';

import '../main.dart';
import 'SignUp_page.dart';

class welcome extends State<TodoApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration(seconds: 2), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => signup()),
      );
    });
  }

  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/welcome.jpeg'),
          fit: BoxFit.fill,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Container(
          alignment: Alignment.center,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Stroked text as border.
              Container(
                child: Text(
                  'WELCOME',
                  style: TextStyle(
                    fontSize: 50,
                    fontFamily: 'Helvetica',
                    foreground: Paint()
                      ..style = PaintingStyle.stroke
                      ..strokeWidth = 1.5
                      ..color = Colors.white,
                    letterSpacing: 3,
                  ),
                ),
              ),
              // Solid text as fill.
              Text(
                '\n\n|Nafeesa Yousaf|',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[300],
                ),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
