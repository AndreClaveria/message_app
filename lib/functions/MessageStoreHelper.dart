import 'dart:typed_data';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:message_app/model/Message.dart';
import 'package:message_app/model/Utilisateur.dart';

class MessageStoreHelper{

  var fire_message = FirebaseFirestore.instance.collection("Chatroom");

  Future <String> getMessages() async {
    String id = fire_message.id;
    return id;
  }

  createChatRoom(String sender, String receiver, String context) {
    String chatroomId = getChatRoomId(sender, receiver);

    var a = DateTime.now().millisecondsSinceEpoch.toString();
    Map<String, dynamic> chatroomMap ={
      "sender": sender,
      "receiver": receiver,
      "date": a,
      "context": context,
    };
    FirebaseFirestore.instance.collection("Chatroom")
        .doc(a)
        .set(chatroomMap);
   
  }
  String getChatRoomId(String a, String b) {
    if(a.substring(0,1).codeUnitAt(0) > b.substring(0,1).codeUnitAt(0)) {
      return "$b\_$a";

    } else {
      return "$a\_$b";
    }
  }






}