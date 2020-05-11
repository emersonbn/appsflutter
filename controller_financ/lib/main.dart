import 'package:flutter/animation.dart';
import "package:flutter/material.dart";
import 'package:controller_financ/generation_route.dart';
//import 'pages/paga1.dart';
//import 'package:intl/intl.dart';
//import 'pages/saldo.dart';

void main() => runApp(MaterialApp(
      debugShowCheckedModeBanner: false,
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
        primarySwatch: Colors.purple,
      ),
      //home: Starting(title: 'Starting'),
      initialRoute: '/Login',
      onGenerateRoute: RouteGenerator.generateRoute,
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  Animation<double> animation;
  AnimationController controller;
  Tween<double> tween = Tween<double>(begin: -200, end: 0);

  @override
  void initState() {
    super.initState();
    controller =
        AnimationController(duration: const Duration(seconds: 2), vsync: this);
    // #docregion addListener
    animation = Tween<double>(begin: 0, end: 300).animate(controller)
      ..addListener(() {
        // #enddocregion addListener
        setState(() {
          // The state that has changed here is the animation object’s value.
        });
        // #docregion addListener
      });
    // #enddocregion addListener
    controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Olá Mundo!!!"),
            ),
            body: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 350.0,
                      minHeight: 350.0,
                    ),
                    child: Column(
                      children: <Widget>[
                        Chip(
                            avatar: CircleAvatar(
                              backgroundColor: Colors.amber,
                              child: Icon(
                                Icons.person,
                                //size: 70.0,
                                color: Colors.deepPurple,
                              ),
                            ),
                            label: Text("OI")),
                        Text(
                          "Usuario",
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 45.5,
                            fontWeight: FontWeight.bold,
                            textBaseline: TextBaseline.ideographic,
                          ),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        FloatingActionButton(
                            child: Icon(Icons.play_arrow),
                            onPressed: () {
                              Navigator.pushNamed(context, "/Page1");
                            })
                      ],
                    ),
                  ),
                ],
              ),
            )));
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }
}
