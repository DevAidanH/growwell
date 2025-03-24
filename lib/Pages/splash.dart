import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:growwell/Pages/homepage.dart';

class Splash extends StatelessWidget {
  const Splash({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column( 
        children: [
          Center(
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 150, horizontal: 25),
              child: SvgPicture.asset("lib/images/undraw_fall_hngs.svg", height: 250)
            ),
          ),
          Text("Welcome to GrowWell", style: TextStyle(fontSize: 30),),
          MaterialButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) => Homepage()));
          },
          child: Text("Get Started"),)
        ],
      ),
    );
  }
}