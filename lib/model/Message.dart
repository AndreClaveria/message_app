import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  String idFrom="";
  String idTo="";
  String timestamp="";
  String content = "";


  Message.vide();

  Message(DocumentSnapshot snapshot) {
    idFrom = snapshot.id;
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    idTo = map["IDTO"];
    timestamp = map["TIMESTAMP"];
    content = map["CONTENT"];
  }


}