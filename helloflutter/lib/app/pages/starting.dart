import 'package:flutter/material.dart';


class Starting extends StatefulWidget{
  Starting({Key key, this.title}) : super(key: key);

  final String title;
  @override
  _StartingState createState() => _StartingState();

}

class _StartingState extends   State<Starting>{
   TextStyle style = TextStyle(fontFamily: 'Montserrat', fontSize: 20.0);

  @override
  Widget build(BuildContext context) {
    final listaItens = Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(100.0),
      color: Color(0xff01A0C7),
      child: MaterialButton(
        minWidth: MediaQuery.of(context).size.width,
        padding: EdgeInsets.fromLTRB(1.0, 1.0, 1.0, 1.0),
        onPressed: ( ) {
          Navigator.pop(context);
        },
        child:  Icon(
      Icons.favorite,
      color: Colors.white60,
      size: 24.0,
      semanticLabel: 'Text to announce in accessibility modes',
    ),
                

      ),
    );

      return Scaffold(
      body: SingleChildScrollView(
      child: Center(
        child: Container(
          color: Colors.white,
          child: Padding(
            padding: const EdgeInsets.all(36.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: 120.0,
                  child: Image.asset(
                    "assets/logo.png",
                    fit: BoxFit.contain,
                  ),
                ),
                SizedBox(height: 15.0),
                listaItens,
              ],
            ),
          ),
        ),
      ),
        )
    );
  }
}