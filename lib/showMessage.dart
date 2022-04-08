
import 'package:flutter/material.dart';
import 'package:message_app/model/Message.dart';
import 'package:message_app/model/Utilisateur.dart';

class showMessage extends StatelessWidget{

  Message message;
  Utilisateur partenaire;
  String monId;


  showMessage(@required String this.monId,@required Utilisateur this.partenaire,@required Message this.message);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Container(
      margin: EdgeInsets.all(10),
      child: Row(
        children: widgetBubble(message.from==monId),
      ),
    );
  }

  List< Widget> widgetBubble(bool moi){
    CrossAxisAlignment alignment = (moi)?CrossAxisAlignment.end:CrossAxisAlignment.start;
    Color colorBubble =(moi)? Colors.green: Colors.blue;
    Color textcolor =Colors.white;
    return <Widget>[
      Expanded(
        child: Column(
          crossAxisAlignment: alignment,
          children: [

            Card(
              elevation: 5.0,

              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              color: colorBubble,
              child: Container(
                width: 175,

                padding: EdgeInsets.all(10.0),
                child: Text(message.texte,style: TextStyle(color: textcolor),),
              ),

            ),


          ],
        ),
      )

    ];

  }

}