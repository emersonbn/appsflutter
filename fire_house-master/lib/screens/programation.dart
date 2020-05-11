import 'package:fire_house/model/porgramacao_model.dart';
import 'package:fire_house/widget/programacao_item.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class ProgramationPage extends StatelessWidget {
  ProgramacaoModel  programacaoModel = ProgramacaoModel();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<QuerySnapshot>(
        future: Firestore.instance.collection('programacao').getDocuments(),
        builder: (context, snapshot){
          if(!snapshot.hasData){
            return Center(
              child: CircularProgressIndicator(),
            );
          }else{
            return ListView(
              children: snapshot.data.documents.map(
                (programcao)=>ProgramcaoItem(programcao.documentID)
              ).toList().reversed.toList()
              );
          }
        }
        );
            
  }
}


