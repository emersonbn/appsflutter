import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:helloflutter/app/pages/login.dart';
import 'package:helloflutter/app/pages/starting.dart';
import 'package:helloflutter/app/pages/taskList.dart';

import 'app/pages/testoauth.dart';

//import 'packege:routing_tutorial/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case '/':
        return CupertinoPageRoute(builder: (_) => MyHomePage());
      case '/starting':
        return CupertinoPageRoute(builder: (_) => Starting());
      
      case '/taskList':
      return CupertinoPageRoute(builder: (_) => TaskList());

      case '/testOauth':
      return CupertinoPageRoute(builder: (_) => TestOauth());

      default:
        return _erroRoute();
    }
  }

  static Route<dynamic> _erroRoute() {
    return MaterialPageRoute(builder: (_) {
      return Scaffold(
        appBar: AppBar(
          title: Text('Error'),
        ),
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }
}
