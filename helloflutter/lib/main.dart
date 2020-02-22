// Copyright 2018 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:flutter/material.dart';
import 'package:helloflutter/route_generate.dart';
//import 'package:oauth1/oauth1.dart';

//import 'app/pages/login.dart';
//import 'app/pages/starting.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
   // define platform (server)
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'World Pets',
      //debugShowCheckedModeBanner: false,
      theme: ThemeData(
            // This is the theme of your application.
            //
            // Try running your application with "flutter run". You'll see the
            // application has a blue toolbar. Then, without quitting the app, try
            // changing the primarySwatch below to Colors.green and then invoke
            // "hot reload" (press "r" in the console where you ran "flutter run",
            // or simply save your changes to "hot reload" in a Flutter IDE).
            // Notice that the counter didn't reset back to zero; the application
            // is not restarted.
            primarySwatch: Colors.green,
          ),
       //home: Starting(title: 'Starting'),
       initialRoute: '/',
       onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}

