import 'package:cloud_firestore/cloud_firestore.dart';

class User {
  String id;
  String email;
  String senha;
  String nome;
  String confirmaSenha;

  User({this.email, this.senha, this.nome, this.id});

  User.fromDocument(DocumentSnapshot doc) {
    this.id = doc.documentID;
    this.nome = doc.data['nome'] as String;
    this.email = doc.data['email'] as String;
  }

  DocumentReference get firestoreRef {
    return Firestore.instance.document('users/$id');
  }

  Future<void> saveData() async {
    await firestoreRef.setData(toMap());
  }

  Map<String, dynamic> toMap() {
    return {
      'name': this.nome,
      'email': this.email,
    };
  }
}
