
import 'package:controller_financ/pages/geral.dart';
import 'package:controller_financ/pages/login.dart';
import 'package:controller_financ/pages/login_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:controller_financ/pages/paga1.dart';
import 'package:controller_financ/pages/saldo.dart';

import 'main.dart';


//import 'packege:routing_tutorial/main.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;

    switch (settings.name) {
      case '/Login':
        return CupertinoPageRoute(builder: (_) => LoginScreen());
      case '/':
        return CupertinoPageRoute(builder: (_) => Home());
      case '/Page1':
        return CupertinoPageRoute(builder: (_) => Paga1());
      case '/Geral':
        return CupertinoPageRoute(builder: (_) => Geral());

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
