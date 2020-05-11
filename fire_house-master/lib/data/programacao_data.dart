import 'package:cloud_firestore/cloud_firestore.dart';

class ProgramacaoData {
  
  String id;

  String titulo;
  String descricao;
  String diasemana;
  String imagem;

  DateTime data;
  
  ProgramacaoData();
  

  ProgramacaoData.fromDocument(DocumentSnapshot snapshot){
    id = snapshot.documentID;
    titulo = snapshot.data['titulo'];
    descricao = snapshot.data['descricao'];
    diasemana = snapshot.data['dia_semana'];
    imagem = snapshot.data['imagem'];
    data = snapshot.data['data'].toDate();
    

  }
  Map<String, dynamic> toResumedMap(){
    return{
      'titulo':titulo,
      'descricao':descricao,
      'diasemana':diasemana,
      'imagem':imagem,
      'data':data
    };
  }
}