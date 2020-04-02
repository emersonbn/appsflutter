import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class MySaldo extends StatefulWidget {
  @override
  _MySaldoState createState() => _MySaldoState();
}

class _MySaldoState extends State<MySaldo> {
  
  double targetValue = 34.0;
  double _saldoAtual = 53104.59;
  final price = NumberFormat('###,###.0#', 'pt_BR');

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: Text("Olá Emerson!!!"),
            ),
            body: Padding(
              padding: EdgeInsets.all(10.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  ConstrainedBox(
                    constraints: const BoxConstraints(
                      minWidth: 50.0,
                      minHeight: 50.0,
                    ),
                  child: Column(
                          children: <Widget>[
                            Align(
                              alignment: Alignment(1.0, 0.0),
                              child: Text(
                                "Seu saldo é:R\$ ${price.format(_saldoAtual)}",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 30.0,
                                    fontWeight: FontWeight.w600),
                              ),
                            )
                          ],
                        )
                  ),
                ],
              ),
            )));
  }
}
