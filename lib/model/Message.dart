import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  String id = "";
  String idFrom="";
  String idTo="";
  String timestamp="";
  String content = "";


  Message.vide();

  Message(DocumentSnapshot snapshot) {
    id = snapshot.id;
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    idFrom = map["FROM"];
    idTo = map["TO"];
    timestamp = map["TIMESTAMP"];
    content = map["CONTENT"];
  }


}