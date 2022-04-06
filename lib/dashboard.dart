import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/material.dart';
import 'package:message_app/MyWidgets/menuDrawer.dart';
import 'package:message_app/discussion.dart';
import 'package:message_app/functions/FirestoreHelper.dart';
import 'package:message_app/model/Message.dart';
import 'package:message_app/model/Utilisateur.dart';
import 'package:message_app/variables/constant.dart';

import 'dart:math';

class dashBoard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return dashBoardState();
  }

}

class dashBoardState extends State<dashBoard>{
 getChatRoomId(String a, String b) {
   if(a.substring(0,1).codeUnitAt(0) > b.substring(0,1).codeUnitAt(0)) {
     return "$b\_$a";

   } else {
     return "$a\_$b";
   }
 }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      drawer: myDrawer(),
      appBar: AppBar(
        title: Text("Dashboard"),
        centerTitle: true,
      ),
      body: bodyPage(),
    );
  }


  Widget bodyPage(){

    return Column (
      children : [


        Text("Bonjours voici vos contact choississez vos favoris !"),
        Text ("Cliquez sur le bouton pour voir vos Amis !"),
        StreamBuilder<QuerySnapshot>(
            stream: FirestoreHelper().fire_user.snapshots(),
            builder: (context, snapshot){
              if(!snapshot.hasData){
                return CircularProgressIndicator();
              }
              else
              {
                List documents = snapshot.data!.docs;

                return ListView.builder(
                    shrinkWrap: true,
                    itemCount: documents.length,
                    itemBuilder: (context,index){
                      Utilisateur user = Utilisateur(documents[index]);



                      if (user.id != FirestoreHelper().getId()){
                        return ListTile(
                          onTap: (){
                            Navigator.push(context, MaterialPageRoute(
                                builder: (context){


                                  return discussion(user: monProfil, monpartenaire: user);
                                }
                            ));
                          },
                          title:Text("${user.prenom}"),
                          trailing: IconButton(onPressed: (){}, icon: Icon(Icons.edit)),
                        );

                      }else{
                        return Container();


                      }

                    }
                );
              }
            }
        ),
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                )
            ),
            onPressed: (){
              print("Je  suis connectÃ©");

            },
            child: Text("Amis")
        ),


      ],

    );
  }
}

