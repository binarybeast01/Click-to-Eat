import 'dart:async';

import 'package:click_to_eat/Views/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:page_transition/page_transition.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    Timer(
        Duration(seconds: 3),
        () => Navigator.pushReplacement(
            context, PageTransition(child: HomePage(), type: PageTransitionType.leftToRightWithFade)));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
                height: 200.0,
                width: 400.0,
                child: Lottie.network(
                    "https://assets3.lottiefiles.com/packages/lf20_IYNhoR.json")),
            RichText(
                text: TextSpan(
              text: "Click",
              style: TextStyle(
                fontSize: 56.0,
                fontWeight: FontWeight.w400,
                color: Colors.black,
              ),
              children: <TextSpan>[
                TextSpan(
                  text: " to",
                  style: TextStyle(
                    fontSize: 48.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
                TextSpan(
                  text: " Eat",
                  style: TextStyle(
                    fontSize: 56.0,
                    fontWeight: FontWeight.w400,
                    color: Colors.black,
                  ),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
