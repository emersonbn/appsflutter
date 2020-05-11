import 'package:flutter/material.dart';


class Geral extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _title('usuario'),
        bottom: null,
        //centerTitle: true,
      ),
      body: ListView(
        children: <Widget>[
          Container(
            height: 250,
            width: 50,
            color: Colors.blue
          ),
          SizedBox(height: 40,),
          Container(
            height: 250,
            width: 50,
            color: Colors.red
          ),
          SizedBox(height: 40,),
          Container(
            height: 250,
            width: 50,
            color: Colors.green
          )
      ],),
    );
  }

  Widget _title(text){

    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(Icons.add_to_home_screen),
        SizedBox(width: 10,),
        Text(text)
    ],);
  }
}