import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'package:message_app/functions/MessageStoreHelper.dart';
import 'package:message_app/model/Message.dart';
import 'package:message_app/model/Utilisateur.dart';
import 'package:message_app/showMessage.dart';

class MessageController extends StatefulWidget{
  Utilisateur id;
  Utilisateur idPartner;
  MessageController(@required Utilisateur this.id,@required Utilisateur this.idPartner);
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return MessageControllerState();
  }

}

class MessageControllerState extends State<MessageController> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: MessageStoreHelper().fire_message.orderBy('envoiMessage',descending: false).snapshots(),
        builder: (BuildContext context, AsyncSnapshot <QuerySnapshot>snapshot) {
          if (!snapshot.hasData) {
            return const CircularProgressIndicator();
          }
          else {
            List<DocumentSnapshot>documents = snapshot.data!.docs;

            return ListView.builder(
                itemCount: documents.length,
                itemBuilder: (BuildContext ctx,int index)
                {
                  Message discussion = Message(documents[index]);
                  if((discussion.from==widget.id.id && discussion.to==widget.idPartner.id)||(discussion.from==widget.idPartner.id&&discussion.to==widget.id.id))
                  {
                    return showMessage(widget.id.id, widget.idPartner, discussion);
                  }
                  else
                  {
                    return Container();
                  }
                }
            );
          }
        }
    );
  }
  
}