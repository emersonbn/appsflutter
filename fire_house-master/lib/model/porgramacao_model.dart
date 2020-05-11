import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fire_house/data/programacao_data.dart';
//import 'package:flutter/cupertino.dart';



class ProgramacaoModel {

  List<ProgramacaoData> programacao = [];



    void listaProgramacao() async {
    QuerySnapshot query = await Firestore.instance.collection('programacao').getDocuments();

      programacao = query.documents.map((doc) => ProgramacaoData.fromDocument(doc)).toList();

  }

}