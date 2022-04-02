import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:message_app/MyWidgets/menuDrawer.dart';
import 'package:message_app/detail.dart';
import 'package:message_app/functions/FirestoreHelper.dart';
import 'package:message_app/model/Utilisateur.dart';

class dashBoard extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return dashBoardState();
  }

}

class dashBoardState extends State<dashBoard>{
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
                                  return detail(user: user);
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