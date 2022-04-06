import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message_app/functions/FirestoreHelper.dart';
import 'package:message_app/functions/MessageStoreHelper.dart';
import 'package:message_app/model/Message.dart';
import 'package:message_app/model/Utilisateur.dart';
import 'package:message_app/variables/constant.dart';
import 'package:intl/intl.dart';

import 'package:google_fonts/google_fonts.dart';

class discussion extends StatefulWidget{
  Utilisateur user;
  Utilisateur monpartenaire;
  discussion({required this.user, required this.monpartenaire});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return discussionState();
  }

}

class discussionState extends State<discussion>{



  String message = "";
  String messagees = "";


  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return Scaffold(

      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.black45,
        toolbarHeight: 70,

        title: Text("${widget.monpartenaire.prenom}  ${widget.monpartenaire.nom}"),


        centerTitle: true,
      ),
      body: Column(
        children: <Widget>[
          showMessage(),
          Expanded(child: writeBar()),
        ],
      ),


    );
  }

  Widget showMessage(){
    return Column(

      /*children: [
        StreamBuilder<QuerySnapshot>(
          stream: MessageStoreHelper().fire_message.snapshots(),
            builder: (context, snapshot){
            if(!snapshot.hasData){
              return CircularProgressIndicator();
            }
            else {
              List documents = snapshot.data!.docs;

              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: documents.length,
                  itemBuilder: (context, index) {
                    Message message = Message(documents[index]);
                    return ListTile(

                      title: Text("${message.content}"),
                    );
                  }
              );
            }
            })

        ],*/
    );
  }
  Widget writeBar() {

    return Container(


        alignment: Alignment.bottomCenter,
          
        child: TextField (

          onChanged: (value){
            setState((){
              message = value;
            });
          },
          decoration: InputDecoration(

              filled: true,
              labelText: 'Enter your message',
              hintText: 'Put a message',
              suffixIcon: IconButton(
                iconSize: 35,
                color: Colors.blue,
                onPressed: (){
                  MessageStoreHelper().createChatRoom(widget.user.id, widget.monpartenaire.id, message);
                },
                icon: Icon(Icons.send),
              )
          ),
        )
    );
  }

}


