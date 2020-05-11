import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../data/programacao_data.dart';
import '../model/porgramacao_model.dart';

class ProgramcaoItem extends StatelessWidget {

  final String idProgramacao;

  ProgramcaoItem(this.idProgramacao);

  @override
  Widget build(BuildContext context) {

    Widget _buildContent(DocumentSnapshot snapshot){

      ProgramacaoData programacao = ProgramacaoData.fromDocument(snapshot);
      
      return Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(8.0),
            width: 120.0,
            child: Image.network(
              programacao.imagem,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(child: 
            Container(
              padding: EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                     programacao.titulo,
                    style: TextStyle(
                      fontWeight: FontWeight.w500, fontSize: 17.0
                    ),
                  ),
                  Text(programacao.diasemana,
                  style: TextStyle(
                    fontWeight: FontWeight.w300
                  ),
                  ),
                  Text(programacao.dataFormat,
                  style: TextStyle(
                    fontWeight: FontWeight.w300
                  ),
                  ), Text(programacao.hours,
                  style: TextStyle(
                    fontWeight: FontWeight.w300
                  ),
                  )
                ],
              ),
            )
          ),
      ],);
    }
    return Card(
      margin: EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: StreamBuilder<DocumentSnapshot>(
        stream: Firestore.instance.collection("programacao").document(idProgramacao).snapshots(),
        builder: (context, snapshot){
            if(!snapshot.hasData){
              return Center(child: CircularProgressIndicator(),);
            }else{
              return _buildContent(snapshot.data);
            }
        }
        )
    );
  }
}