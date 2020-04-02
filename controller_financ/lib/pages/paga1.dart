import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class Paga1 extends StatefulWidget {
  @override
  _Paga1State createState() => _Paga1State();
}

class _Paga1State extends State<Paga1> {
  List<Step> step = [
    Step(title: Text("text1"), content: Icon(Icons.play_circle_filled))
  ];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        minimum: EdgeInsets.fromLTRB(0.0, 0.0, 0.0, 0.5),
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Expanded(
                //width: 250,
                //height: 850,
                child: Stack(
                    alignment: AlignmentDirectional.topEnd,
                    fit: StackFit.expand,
                    //overflow: Overflow.visible,
                    children: <Widget>[
                  Positioned(
                    top: 0.0,
                    left: 0.0,
                    right: 0.0,
                    height: 320,
                    //bottom: 0.0,
                    child: topSaldo(context),
                  ),
                  Positioned(
                      top: 200.0,
                      left: 0.0,
                      right: 0.0,
                      //bottom: 45.0,
                      height: 100,
                      //bottom: 0.0,
                      child: listItensConta()),
                  /*
                  Positioned(
                    top:350.0,
                     left: 0.0,
                      right: 0.0,
                      child: Container(color: Colors.blue[100]),
                       )*/
                ])),
            Expanded(
              child: Container(
                  color: Colors.blue[100],
                  child: ListView(
                    children: const <Widget>[
                      Card(child: ListTile(title: Text('One-line ListTile'))),
                      Card(
                        child: ListTile(
                          leading: FlutterLogo(),
                          title: Text('One-line with leading widget'),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('One-line with trailing widget'),
                          trailing: Icon(Icons.more_vert),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: FlutterLogo(),
                          title: Text('One-line with both widgets'),
                          trailing: Icon(Icons.more_vert),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          title: Text('One-line dense ListTile'),
                          dense: true,
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: FlutterLogo(size: 56.0),
                          title: Text('Two-line ListTile'),
                          subtitle: Text('Here is a second line'),
                          trailing: Icon(Icons.more_vert),
                        ),
                      ),
                      Card(
                        child: ListTile(
                          leading: FlutterLogo(size: 72.0),
                          title: Text('Three-line ListTile'),
                          subtitle: Text(
                              'A sufficiently long subtitle warrants three lines.'),
                          trailing: Icon(Icons.more_vert),
                          isThreeLine: true,
                        ),
                      ),
                    ],
                  )),
            )
          ],
        ));
  }
}

Widget topSaldo(BuildContext context) {
  return Container(
    //color: Colors.purple[300],
    decoration: BoxDecoration(
      gradient: SweepGradient(
        center: FractionalOffset.centerRight,
        startAngle: 1.9,
        endAngle: 3.1452 * 1.355,
        colors: const <Color>[
          Colors.black12,
          Color(0xFF8E24AA), // blue
          Color(0xFFAA00FF), // green
          Colors.black26,
          Color(0xFFCE93D8)
          //Color(0xFF8E24AA), // blue again to seamlessly transition to the start
        ],
        stops: const <double>[0.00, 0.47, 0.50, 0.75, 1.00],
      ),
    ),
    //padding: EdgeInsets.all(10.0),
    height: 250.0,
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Container(
          alignment: Alignment(-1.0, -1.0),
          height: 45.0,
          child: GestureDetector(
              child: Icon(
                Icons.keyboard_arrow_left,
                size: 45.0,
                color: Colors.white,
              ),
              onTap: () {
                Navigator.pushNamed(context, "/");
              }),
        ),
        Container(
          // color: Colors.purple[400],
          height: 200.0,

          // width:  250.0,
          alignment: Alignment(0.0, -0.45),
          child: Column(children: <Widget>[
            Center(
              child: Text(
                "Saldo atual:",
                style: GoogleFonts.mcLaren(
                  textStyle: TextStyle(
                    decoration: TextDecoration.none,
                    fontSize: 20.0,
                    //fontWeight: FontWeight.normal,
                    color: Colors.blueAccent,
                    //fontStyle: FontStyle.italic,
                    //fontFamily: 'Hind'
                  ),
                ),
              ),
            ),
            Text(
              "R\$ 5.000,00",
              textAlign: TextAlign.center,
              //textDirection: TextDirection.ltr,
              style: GoogleFonts.mcLaren(
                textStyle: TextStyle(
                  decoration: TextDecoration.none,
                  fontSize: 35.0,
                  //fontWeight: FontWeight.normal,
                  color: Colors.white,
                  //fontStyle: FontStyle.italic,
                  //fontFamily: 'Hind'
                ),
              ),
            ),
          ]),
        ),
      ],
    ),
  );
}

Widget listItensConta() {
  return Container(
    height: 150.0,
    alignment: Alignment(0.0, 0.0),
    //width: 350.0,
    child: ListView(
      scrollDirection: Axis.horizontal,
      padding: const EdgeInsets.all(8),
      children: <Widget>[
        itemList(Icons.perm_contact_calendar, 'Text'),
        SizedBox(
          width: 5.0,
        ),
        itemList(Icons.keyboard_hide, 'Text2-teste'),
        SizedBox(
          width: 5.0,
        ),
        itemList(Icons.play_arrow, 'Text2-teste1'),
        SizedBox(
          width: 5.0,
        ),
        itemList(Icons.perm_device_information, 'Text3-teste1-teste2'),
        SizedBox(
          width: 5.0,
        ),
        itemList(Icons.picture_as_pdf, 'Text3-teste1-teste2'),
      ],
    ),
  );
}

Widget itemList(IconData icons, String text) {
  return Container(
    height: 50,
    width: 100,
    padding: EdgeInsets.all(10.0),
    decoration: BoxDecoration(
      color: Colors.purple[100],
    ),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
        Icon(icons, color: Colors.blueAccent),
        SizedBox(
          height: 12,
        ),
        Text(
          text,
          textAlign: TextAlign.left,
          overflow: TextOverflow.visible,
          maxLines: 2,
          textScaleFactor: 0.8,
          style: TextStyle(
              fontSize: 14.0,
              decoration: TextDecoration.none,
              textBaseline: TextBaseline.alphabetic,
              backgroundColor: Colors.white10,
              color: Colors.blueAccent),
        ),
      ],
    ),
  );
}
