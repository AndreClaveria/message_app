import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message_app/functions/FirestoreHelper.dart';
import 'package:message_app/functions/MessageStoreHelper.dart';
import 'package:message_app/model/Utilisateur.dart';

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
        height: 15000,
        width: 1000,

 /*     children: [
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
                  MessageStoreHelper().createChatRoom(FirestoreHelper().getId(), widget.user.id, message);
                },
                icon: Icon(Icons.send),
              )
          ),
        )
    );
  }
}


