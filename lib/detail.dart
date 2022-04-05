import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message_app/functions/FirestoreHelper.dart';
import 'package:message_app/model/Message.dart';
import 'package:message_app/model/Utilisateur.dart';

import 'package:intl/intl.dart';

import 'package:google_fonts/google_fonts.dart';

class detail extends StatefulWidget{
  Utilisateur user;

  detail({required Utilisateur this.user});
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return detailState();
  }

}

class detailState extends State<detail>{

  getChatRoomId(String a, String b) {
    if(a.substring(0,1).codeUnitAt(0) > b.substring(0,1).codeUnitAt(0)) {
      return "$b\_$a";

    } else {
      return "$a\_$b";
    }
  }
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

        title: Text("${widget.user.prenom}  ${widget.user.nom}"),


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
    return Container(

      // children: [
      //   StreamBuilder<QuerySnapshot>(
      //     stream: FirestoreHelper().fire_message.snapshots(),
      //       builder: (context, snapshot){
      //       if(!snapshot.hasData){
      //         return CircularProgressIndicator();
      //       }
      //       else {
      //         List documents = snapshot.data!.docs;
      //[
      //         return ListView.builder(
      //             shrinkWrap: true,
      //             itemCount: documents.length,
      //             itemBuilder: (context, index) {
      //               Utilisateur message = Utilisateur(documents[index]);
      //               return ListTile(
      //                 title: Text("${message.id}"),
      //               );
      //             }
      //         );
      //       }
      //       })
      //
      // ],
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
                  clickMessage(message);
                },
                icon: Icon(Icons.send),
              )
          ),
        )
    );
  }

  clickMessage(String messages) {
    var chatroomIda = getChatRoomId(FirestoreHelper().getId(), widget.user.id);
    print(chatroomIda);
    if(messages.isNotEmpty) {
      Map<String, String> messageMap = {
        "message" : messages,
        "sender" : FirestoreHelper().getId(),


      };
      FirestoreHelper().sendMessage(chatroomIda, messageMap);

    }
  }
}


