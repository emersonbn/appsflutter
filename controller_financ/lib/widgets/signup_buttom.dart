import 'package:flutter/material.dart';


class SignUpButtom extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FlatButton(
      padding: EdgeInsets.only(
        top: 20
      ) ,
        onPressed: (){}, 
        child: Text("Não possui uma conta? Cadastra-se", textAlign: TextAlign.center,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontSize: 15,
        fontWeight: FontWeight.w600,
        color: Colors.redAccent,
        letterSpacing: 0.6
        ),)
        );
  }
}