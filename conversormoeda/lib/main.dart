import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

const request = "https://api.hgbrasil.com/finance?format=json&key=4392ad9a";

void main() async {
  runApp(MaterialApp(
    home: HomeApp(),
    theme: ThemeData(
        hintColor: Colors.black,
        primaryColor: Colors.white,
        inputDecorationTheme: InputDecorationTheme(
          enabledBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.white)),
          focusedBorder:
              OutlineInputBorder(borderSide: BorderSide(color: Colors.amber)),
          hintStyle: TextStyle(color: Colors.black),
        )),
  ));
}

Future<Map> getData() async {
  http.Response response = await http.get(request);
  return json.decode(response.body);
}

class HomeApp extends StatefulWidget {
  @override
  _HomeAppState createState() => _HomeAppState();
}

class _HomeAppState extends State<HomeApp> {

  final realController = TextEditingController();
  final dolarController = TextEditingController();
  final euroController = TextEditingController();

  double dolar;
  double euro;

  void _realChanged(String text){
    double real = double.parse(text);
    dolarController.text = (real/dolar).toStringAsFixed(2);
    euroController.text = (real/euro).toStringAsFixed(2);

  }
  void _dolarChanged(String text){
    double dolar = double.parse(text);
    realController.text = (dolar * this.dolar).toStringAsFixed(2);
    euroController.text = (dolar * this.dolar / euro).toStringAsFixed(2);
  }
  void _euroChanged(String text){
    double euro = double.parse(text);
    realController.text = (euro * this.euro).toStringAsFixed(2);
    dolarController.text = (euro * this.euro / dolar).toStringAsFixed(2);
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[300],
      appBar: AppBar(
        title: Text("\$ Conversor \$"),
        backgroundColor: Colors.amberAccent,
        centerTitle: true,
      ),
      body: FutureBuilder<Map>(
          future: getData(),
          builder: (context, snapshot) {
            switch (snapshot.connectionState) {
              case ConnectionState.none:
              case ConnectionState.waiting:
                return Center(
                  child: Text(
                    "Carregando Dados....",
                    style: TextStyle(color: Colors.amberAccent, fontSize: 25.0),
                    textAlign: TextAlign.center,
                  ),
                );
              default:
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Erro ao obter dados! :(",
                      style:
                          TextStyle(color: Colors.amberAccent, fontSize: 25.0),
                      textAlign: TextAlign.center,
                    ),
                  );
                } else {
                  dolar = snapshot.data["results"]["currencies"]["USD"]["buy"];
                  euro = snapshot.data["results"]["currencies"]["EUR"]["buy"];
                  return SingleChildScrollView(
                      padding: EdgeInsets.all(10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          Icon(Icons.monetization_on, size: 150.0, color: Colors.black),
                          buildTextField("Reais", "R\$",realController,_realChanged),
                          Divider(),
                          buildTextField("Dólares", "US\$",dolarController,_dolarChanged),
                          Divider(),
                          buildTextField("Euros", "€",euroController, _euroChanged),
                        ],
                      ));
                }
            }
          }),
    );
  }
}

Widget buildTextField(String label, String prefix, TextEditingController c, Function f) {
  return TextField(
    controller: c,
    decoration: InputDecoration(
      labelText: label,
      labelStyle: TextStyle(color: Colors.black),
      border: OutlineInputBorder(),
      prefixText: prefix,
    ),
    style: TextStyle(color: Colors.black, fontSize: 25.0),
    onChanged: f,
    keyboardType: TextInputType.number,
  );
}
