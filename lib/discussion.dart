import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message_app/functions/FirestoreHelper.dart';
import 'package:message_app/functions/MessageStoreHelper.dart';
import 'package:message_app/model/Utilisateur.dart';
import 'package:message_app/messageController.dart';
import 'package:message_app/variable/lib.dart';

import 'detail.dart';
import 'model/Message.dart';

class discussion extends StatefulWidget{
  Utilisateur user;

  discussion({required this.user});
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
      backgroundColor: Colors.white12,
        appBar: AppBar(
        flexibleSpace: GestureDetector(
        onTap: (){
          Navigator.push(context, MaterialPageRoute(
            builder: (context){
              return Detail(user: widget.user,);
            }
          ));

        }
        ),
          title: Text("${widget.user.prenom}  ${widget.user.nom}"),
          centerTitle: true,

        ),
      // ),
      body: Stack(
        children: <Widget>[
          showMessage(),

          writeBar(),
        ],
      ),
    );
  }

  Widget showMessage(){
    return Container(
        child: Column(
          children: [
            new Flexible(child: Container(
              height: MediaQuery.of(context).size.height,
              child: MessageController(monProfil, widget.user),
            )),
            new Divider(height: 1.5,),
            writeBar()
          ],
        ),
    );
  }
  Widget writeBar() {

    return Container(
        alignment: Alignment.bottomCenter,
          
        child: TextField (
          style: TextStyle(color: Colors. white),
          onChanged: (value){
            setState((){
              message = value;
            });
          },
          decoration: InputDecoration(

              filled: true,


              suffixIcon: IconButton(
                iconSize: 35,
                color: Colors.lightBlue,
                onPressed: (){
                  MessageStoreHelper().sendMessage(message, widget.user, monProfil);
                },
                icon: Icon(Icons.send),
              )
          ),
        )
    );
  }


}


