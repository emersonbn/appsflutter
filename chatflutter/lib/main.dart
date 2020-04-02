//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

//import 'chart_screen.dart';
//import 'login_screen.dart';

void main() {

  runApp(MyApp());
  
  

}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        iconTheme: IconThemeData(color: Colors.blue)
      ),
      home: Container(),
    );
  }
}

