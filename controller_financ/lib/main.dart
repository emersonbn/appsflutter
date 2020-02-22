import "package:flutter/material.dart";
import 'package:intl/intl.dart';

void main() => runApp(MaterialApp(
      home: Home(),
    ));

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final String _appUsuario = "Emerson";
  double targetValue = 34.0;
  double _saldoAtual = 104.59;
  final price = NumberFormat('###.0#', 'pt_BR');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepOrange,
      appBar: AppBar(
        title: Row(
          children: <Widget>[
            Text(
              "Olá ${_appUsuario}",
              style: TextStyle(fontSize: targetValue),
            ),
          ],
        ),
      ),
      body: Center(
        child: Container(
            decoration: BoxDecoration(
              shape :BoxShape.rectangle,
              color: Colors.blue[100]
            ),
            padding: EdgeInsets.all(4.0),
            margin: EdgeInsets.all(4.0),
            height: 400.0,
            child: Row(
            children: <Widget>[
              Text(
              "R\$ ${price.format(_saldoAtual)}",
              textAlign: TextAlign.center,
              style: TextStyle(color: Colors.blue[600], fontSize: 50.0),
            )
          ],
        ),
      ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: Colors.orangeAccent[100],
        iconSize: 45.0,
        items: [
          BottomNavigationBarItem(title:Text("DashBoard"),icon: Icon(Icons.dashboard)),
          BottomNavigationBarItem(title:Text("Help"),icon: Icon(Icons.help_outline)),
          BottomNavigationBarItem(title:Text("Settings"),icon: Icon(Icons.settings)),

        ]),
    );
  }
}
