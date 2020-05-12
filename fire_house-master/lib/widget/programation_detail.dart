import 'package:fire_house/data/programacao_data.dart';
import 'package:flutter/material.dart';

class ProgramationDetail extends StatelessWidget {
  final ProgramacaoData programationItem;

  ProgramationDetail(this.programationItem);
  @override
  Widget build(BuildContext context) {
    if (programationItem != null) {
      return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            Container(
              color: Colors.blueAccent,
              height: 50.0,
              child: MaterialButton(onPressed: (){}, child: Icon(Icons.backspace),)
            ),
            Container(
              color: Color.fromRGBO(200, 200, 200, 0.5),
              padding: EdgeInsets.all(8.0),
              width: 250.0,
              child: Image.network(
                programationItem.imagem,
                fit: BoxFit.cover,
              ),
            ),
            Expanded(
                child: Column(
              children: <Widget>[
                Text(
                  programationItem.diasemana,
                ),
                Text(programationItem.hours),
                SingleChildScrollView(
                  scrollDirection: Axis.vertical,
                  child:  Text(
                    programationItem.descricao,
                    overflow:TextOverflow.clip,
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              
              ],
            ))
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.all(8.0),
        width: 320.0,
      );
    }
  }
}
