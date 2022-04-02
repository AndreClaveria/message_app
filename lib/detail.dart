import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message_app/model/Utilisateur.dart';

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
      body: chatingSection(),


    );
  }

}

class chatingSection extends StatefulWidget{


  @override
  State<chatingSection> createState() => _chatingSectionState();
}

class _chatingSectionState extends State<chatingSection> {
  String textInput = "";
  @override
  Widget build(BuildContext context) {

      return const Align(
          alignment: Alignment.bottomCenter,

        child: TextField (
          decoration: InputDecoration(
            filled: true,

            labelText: 'Enter your message',
            hintText: 'Put a message',

            fillColor: Colors.white30

          ),
        )

       /* Container(
          height: 100,
          width: 1000,
          color: Colors.green,


          )*/

      );





    }
}

