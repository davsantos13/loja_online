import 'package:cloud_firestore/cloud_firestore.dart';

class Product {
  String id;
  String nome;
  String descricao;
  List<String> urlImagens;

  Product.fromDocument(DocumentSnapshot doc) {
    this.id = doc.documentID;
    this.nome = doc['nome'] as String;
    this.descricao = doc['descricao'] as String;
    this.urlImagens = List<String>.from(doc.data['urls'] as List<dynamic>);
  }
}
