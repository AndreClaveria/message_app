import 'package:cloud_firestore/cloud_firestore.dart';

class Message{
  String id="";
  String textInput="";
  String author="";
  DateTime? sendDay;


  Message.vide();

  Message(DocumentSnapshot snapshot) {
    id = snapshot.id;
    Map<String, dynamic> map = snapshot.data() as Map<String, dynamic>;
    textInput = map["TEXTINPUT"];
    author = map["AUTHOR"];
    sendDay = map["SENDDAY"];
  }
}