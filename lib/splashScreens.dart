import 'dart:async';
import 'package:flutter/material.dart';
import 'package:splash_screen_view/SplashScreenView.dart';
import 'homeScreen.dart';

class splashCircular extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    Timer(Duration(seconds: 3), (){
      Navigator.pushReplacement(context,
          MaterialPageRoute(builder: (context)=> HomeScreen(),)
      );
    });
    return Scaffold(
        backgroundColor: Colors.blue[100],
        body: Center(
          child: CircularProgressIndicator(),
        )
    );
  }
}


class viewSplash extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SplashScreenView(
      backgroundColor: Colors.blue[100],
      navigateRoute: splashCircular(),
      duration: 3000,
      imageSize: 200,
      imageSrc: 'images/clock.PNG',
    );
  }
}
