import 'package:flutter/material.dart';
import 'package:task7dsc/splashScreens.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Future.delayed(Duration(microseconds: 5));
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'Date && time',
     home: viewSplash()
  ));
}




