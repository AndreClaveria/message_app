import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message_app/MyWidgets/menuDrawer.dart';
import 'package:message_app/discussion.dart';
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

 getChatRoomId(String a, String b) {
   if(a.substring(0,1).codeUnitAt(0) > b.substring(0,1).codeUnitAt(0)) {
     return "$b\_$a";

   } else {
     return "$a\_$b";
   }
 }
 PopAmisAmis(){
   showDialog(
       context: context,
       barrierDismissible: false,
       builder: (context){

         if(Platform.isIOS){
           return CupertinoAlertDialog(
             title: Text("Voulez-vous passez un bon moment ?"),
             actions: [
               ElevatedButton(
                   onPressed: (){
                     Navigator.pop(context);
                   },
                   child: Text("Non")
               ),
               ElevatedButton(
                 onPressed: (){
                 },
                 child: Text("Non"),
               )

             ],
           );
         }
         else
         {
           return AlertDialog(
             title: Text("Vous voulez passez un bon moment ?"),
             actions: [
               ElevatedButton(
                   onPressed: (){
                     Navigator.pop(context);
                   },
                   child: Text("Non")
               ),
               ElevatedButton(
                 onPressed: (){
                 },
                 child: Text("Non"),
               )
             ],

           );
         }
       }
   );

 }

 PopAmis(){
   showDialog(
       context: context,
       barrierDismissible: false,
       builder: (context){

         if(Platform.isIOS){
           return CupertinoAlertDialog(
             title: Text("Voulez-vous l'ajouté a vos amis ?"),
             actions: [
               ElevatedButton(
                   onPressed: (){
                     Navigator.pop(context);
                   },
                   child: Text("Annuler")
               ),
               ElevatedButton(
                 onPressed: (){
                 },
                 child: Text("Oui"),
               )

             ],
           );
         }
         else
         {
           return AlertDialog(
             title: Text("Voulez-vous l'ajouté a vos amis ?"),
             actions: [
               ElevatedButton(
                   onPressed: (){
                     Navigator.pop(context);
                   },
                   child: Text("Annuler")
               ),
               ElevatedButton(
                 onPressed: (){
                 },
                 child: Text("Oui"),
               )
             ],
           );
         }
       }
   );

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
        SizedBox(height: 20,),
        Text("Bonjour voici vos contact choississez vos favoris !"),
        SizedBox(height: 20,),
        Text ("Cliquer sur l'icone du drawer pour activer la variable monProfil!"),
        SizedBox(height: 20,),
        Text ("Cliquer sur un  Amis pour converser avec lui !"),
        SizedBox(height: 40,),
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


                                  return discussion(user: user);
                                }
                            ));
                          },
                          title:Text("${user.prenom}"),
                          trailing: IconButton(onPressed: (){PopAmis();}, icon: Icon(Icons.favorite, color : Colors.lightBlue)),
                          leading: Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                          fit: BoxFit.fill,
                          image:(user.avatar!=null)?NetworkImage(user.avatar!):const NetworkImage("https://firebasestorage.googleapis.com/v0/b/projetfinalb2.appspot.com/o/inconnu.jpeg?alt=media&token=fe5ffbb2-f9fa-4a7a-bdc1-6a482817c9d4")
                             )
                          ),
                          )
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
              PopAmisAmis();
            },
            child: Text("Amis")
        ),


      ],

    );
  }
}

