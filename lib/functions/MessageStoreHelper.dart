
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:message_app/model/Utilisateur.dart';

class MessageStoreHelper{

  var fire_message = FirebaseFirestore.instance.collection("Chatroom");
  var fire_conversation = FirebaseFirestore.instance.collection("Conversation");

  Future <String> getMessages() async {
    String id = fire_message.id;
    return id;
  }


  sendMessage(String texte,Utilisateur user,Utilisateur moi){
    DateTime date=DateTime.now();
    Map <String,dynamic>map={
      'from':moi.id,
      'to':user.id,
      'texte':texte,
      'envoiMessage':date
    };

    String idDate = date.microsecondsSinceEpoch.toString();

    addMessage(map, getMessageRef(moi.id, user.id, idDate));

    addConversation(getConversation(moi.id, user, texte, date), moi.id);

    addConversation(getConversation(user.id, moi, texte, date), user.id);




  }

  Map <String,dynamic> getConversation(String sender,Utilisateur partenaire,String texte,DateTime date){
    Map <String,dynamic> map = partenaire.toMap();
    map ['idmoi']=sender;
    map['lastmessage']=texte;
    map['envoimessage']=date;
    map['destinateur']=partenaire.id;

    return map;

  }


  String getMessageRef(String from,String to,String date){
    String resultat="";
    List<String> liste=[from,to];
    liste.sort((a,b)=>a.compareTo(b));
    for(var x in liste){
      resultat += x+"+";
    }
    resultat =resultat + date;
    return resultat;

  }



  addMessage(Map<String,dynamic> map,String uid){
    fire_message.doc(uid).set(map);

  }

  addConversation(Map<String,dynamic> map,String uid){
    fire_conversation.doc(uid).set(map);

  }

  String getChatRoomId(String a, String b) {
    if(a.substring(0,1).codeUnitAt(0) > b.substring(0,1).codeUnitAt(0)) {
      return "$b\_$a";

    } else {
      return "$a\_$b";
    }
  }






}