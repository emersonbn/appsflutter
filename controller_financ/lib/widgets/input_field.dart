import 'package:flutter/material.dart';

class InputField extends StatelessWidget {

  final String hint;
  final bool obscure;
  final IconData icon;
  final Color _defaultColorText = Colors.black;

  InputField({this.hint,this.obscure,this.icon});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            color: _defaultColorText,
            width: 0.5,
          ),
        )
      ),
    child: TextFormField(
      obscureText: obscure,
      style: TextStyle(color: _defaultColorText),
      decoration: InputDecoration(
        icon: Icon(
          icon,
          color: _defaultColorText
        ),
        border: InputBorder.none,
        hintText: hint,
        hintStyle: TextStyle(
          color: _defaultColorText,
          fontSize: 15,
        ),
        contentPadding: EdgeInsets.only(top: 30, right: 30, bottom: 30, left: 5),
      ),
    ),   
    );
  }
}