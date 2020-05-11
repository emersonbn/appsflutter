import 'package:flutter/material.dart';
import 'package:splashscreen/splashscreen.dart';
import 'package:fire_house/home_screen.dart';

void main() {
  runApp(new MaterialApp(
    debugShowCheckedModeBanner: false,
    home: new MyApp(),
  ));
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return SplashScreen(
      seconds: 3,
      navigateAfterSeconds: HomeScreen(),
      backgroundColor: Colors.white,
      image: Image.asset('assets/images/batimentos.png'),
      loaderColor: Colors.black,
      photoSize: 150.0,
    );
  }
}
