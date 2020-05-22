import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';

import 'package:intl/intl.dart';
  
  //Intl.defaultLocale = 'pt_BR';

class ProgramacaoData {
    
  
  
  String id;

  String titulo;
  String descricao;
  String diasemana;
  String imagem;
  String hours;
  //String data;
  String dataFormat;

  Timestamp dateFire;
  
  ProgramacaoData();
  

  ProgramacaoData.fromDocument(DocumentSnapshot snapshot){
    initializeDateFormatting('pt-BR', null);
    
    id = snapshot.documentID;
    titulo = snapshot.data['titulo'];
    descricao = snapshot.data['descricao'];
    diasemana = snapshot.data['dia_semana'];
    imagem = snapshot.data['imagem'];
    hours = '00:00:00';
    //data = ;3
    //hours = new DateFormat("HH:mm:ss").format(snapshot.data['data'].toHours());
    //print(hours);
    print(snapshot.data['data']);
    print(snapshot.data['data'].toDate());
    dateFire = snapshot.data['data'];
    dateFire.toDate();
    //print(snapshot.data['data'].toDateTime());
    //print(DateTime.fromMillisecondsSinceEpoch( * 1000));
    dataFormat = new DateFormat("dd/MM/yyyy HH:mm:ss").format(snapshot.data['data'].toDate());
    hours = dataFormat.substring(10);
    print(dataFormat);
    

  }
  Map<String, dynamic> toResumedMap(){
    return{
      'titulo':titulo,
      'descricao':descricao,
      'diasemana':diasemana,
      'imagem':imagem,
      'dataFormat':dataFormat,
      'hours':hours
    };
  }
}