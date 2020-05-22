import 'package:fire_house/data/programacao_data.dart';
import 'package:flutter/material.dart';

class ProgramationDetail extends StatefulWidget {
  final ProgramacaoData programationItem;

  ProgramationDetail(this.programationItem);

  @override
  _ProgramationDetailState createState() => _ProgramationDetailState();
}

class _ProgramationDetailState extends State<ProgramationDetail> {
  double _postionTopWiget = 0.20;

  double _heigeitTopWiget = 150;
  double _heightDescricao = 2;
  
  Icon descptionIcon = Icon(Icons.arrow_drop_down);
  void change() {
    setState(() {
      if (_postionTopWiget != 0.1) {
        _postionTopWiget = 0.1;
        _heigeitTopWiget = 550;
        _heightDescricao = 350;
        descptionIcon = Icon(Icons.arrow_drop_up);
      } else {
        _heightDescricao = 2;
        _postionTopWiget = 0.20;
        _heigeitTopWiget = 150;
        descptionIcon = Icon(Icons.arrow_drop_down);
        
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (widget.programationItem != null) {
      return Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
            backgroundColor: Colors.transparent, title: Text("Programação")),
        body: SafeArea(
            child: Stack(
          //alignment: Alignment.topCenter,
          //fit: StackFit.loose,
          children: <Widget>[
            Positioned(
              top: 0,
              //right: 20,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Color.fromRGBO(95, 60, 160, 0.6),
                //height: 500,
                child: Image.network(
                  widget.programationItem.imagem,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            /*
            Positioned(
              bottom: 0,
              right: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                color: Colors.transparent,//Color.fromRGBO(95, 60, 160, 0.8),
                height: 300,
              ),
            ),
            */
            AnimatedPositioned(
              top: MediaQuery.of(context).size.height * _postionTopWiget,
              curve: Curves.easeInOutBack,
              right: 30,
              left: 30,
              duration: const Duration(milliseconds: 300),
              child: AnimatedContainer(
                padding: EdgeInsets.all(8.0),
                width: MediaQuery.of(context).size.width * 0.2,
                //color: Color.fromRGBO(95, 60, 160, 0.9),
                decoration: new BoxDecoration(
                    color: Color.fromRGBO(95, 60, 160, 0.9),
                    borderRadius: new BorderRadius.only(
                      topLeft: const Radius.circular(50.0),
                      topRight: const Radius.circular(50.0),
                      bottomLeft: const Radius.circular(50.0),
                      bottomRight: const Radius.circular(50.0),
                    )),
                duration: const Duration(milliseconds: 550),
                height: _heigeitTopWiget,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: <Widget>[
                
                      Text(
                        widget.programationItem.titulo,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            inherit: false,
                            fontWeight: FontWeight.w900,
                            color: Colors.red[400],
                            fontSize: 35,
                            textBaseline: TextBaseline.ideographic,
                            fontFamily: 'DancingScript'),
                      ),
                    Text(
                      ' ${widget.programationItem.diasemana}-${widget.programationItem.dataFormat.substring(0, 10)}',
                      textAlign: TextAlign.center,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                          inherit: false,
                          fontWeight: FontWeight.w900,
                          color: Colors.red[400],
                          fontSize: 25,
                          textBaseline: TextBaseline.ideographic,
                          fontFamily: 'DancingScript'),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text('Descrição',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            inherit: false,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                            fontSize: 20)),
                    GestureDetector(
                      onTap: () {
                        print('Animation is here');
                        change();
                      },
                      child: descptionIcon
                      ),
                    //Expanded(
                    //child:
                    AnimatedContainer(
                      curve: Curves.easeIn,
                       duration: const Duration(milliseconds: 500),
                        height: _heightDescricao,
                        child: SingleChildScrollView(
                          scrollDirection: Axis.vertical,
                          padding: EdgeInsets.all(5.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: <Widget>[
                              Text(
                                widget.programationItem.descricao,
                                overflow: TextOverflow.clip,
                                style: TextStyle(
                                    inherit: false,
                                    fontSize: 25,
                                    fontFamily: 'DancingScript'),
                              ),
                            ],
                          ),
                        ))
                    // )
                  ],
                ),
              ),
            ),

          ],
        )),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(8.0),
        width: 320.0,
      );
    }
  }
}

/*

          Container(
              color: Color.fromRGBO(95, 60, 160, 0.4),
              padding: EdgeInsets.all(8.0),
              child: Column(
                children: <Widget>[
                  SizedBox(
                    height: 25.0,
                  ),
                  Container(
                    // color: Color.fromRGBO(95, 60, 160, 0.5),
                    padding: EdgeInsets.all(8.0),
                    width: 380.0,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Image.network(
                          programationItem.imagem,
                          fit: BoxFit.cover,
                        ),
                        Text(
                          programationItem.titulo,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              inherit: false,
                              fontWeight: FontWeight.w900,
                              color: Colors.black54,
                              fontSize: 35,
                              textBaseline: TextBaseline.ideographic,
                              fontFamily: 'DancingScript'),
                        ),
                        Text(
                          ' ${programationItem.diasemana}-${programationItem.dataFormat}',
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                              inherit: false,
                              fontWeight: FontWeight.w800,
                              color: Colors.blueAccent,
                              fontSize: 20,
                              textBaseline: TextBaseline.ideographic,
                              fontFamily: 'DancingScript'),
                        ),
                        Text('Descrição:',
                            style: TextStyle(
                                inherit: false,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Arial',
                                fontSize: 18)),
                      ],
                    ),
                  ),
                  Expanded(
                      child: SingleChildScrollView(
                    scrollDirection: Axis.vertical,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: <Widget>[
                        Text(
                          programationItem.descricao,
                          overflow: TextOverflow.clip,
                          style: TextStyle(
                              inherit: false,
                              fontSize: 18,
                              fontFamily: 'DancingScript'),
                        ),
                      ],
                    ),
                  ))
                ],
              )
            )
            */
