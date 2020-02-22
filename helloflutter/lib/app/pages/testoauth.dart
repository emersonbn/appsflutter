import 'package:flutter/material.dart';
import 'package:helloflutter/tokerizando.dart';


class TestOauth extends StatefulWidget{
  TestOauth({Key key}) : super(key: key);

  
  @override
  _TestOauthState createState() => _TestOauthState();

}

//_totalMinhaPendencias   Text( _totalPendecias.toString()  style: TextStyle(fontSize: 32.0, color: Colors.red));
              
class _TestOauthState extends   State<TestOauth>{
  
  final FluigClient clientfluig = new FluigClient( username: 'administrador',password: 'plexlow360optF');
 
  //final tkList = 
  @override
  Widget build(BuildContext context) {
   
   clientfluig.authorize();

    return Scaffold(
      appBar: AppBar(title: Text('Main Task List')),
      body: Center(
        child: Container(
          color: Colors.teal,
            child: Padding(
            padding: const EdgeInsets.all(5.0),
            child: Column(
              //crossAxisAlignment: CrossAxisAlignment.center,
             // mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text('Minhas pendências'),
                ]
            )
            )
        ),
      ),
    );
  }
  

}
