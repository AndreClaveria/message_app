import 'package:flutter/material.dart';
import 'package:message_app/model/Utilisateur.dart';

class Detail extends StatefulWidget{
  Utilisateur user;
  Detail({Key? key, required this.user}) : super(key: key);

  @override
  State<StatefulWidget> createState() {

    return DetailState();
  }

}

class DetailState extends State<Detail>{
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        appBar: AppBar(
            elevation: 0.0,
            backgroundColor: Colors.transparent,

        ),
        backgroundColor: Colors.white12,
        extendBodyBehindAppBar: true,

        body: Stack(
          children: [

            Container(
              padding: const EdgeInsets.all(20),
              child: bodyPage(),
            )


          ],
        )

    );
  }



  Widget bodyPage(){
    return Center(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            Container(
              height: 150,
              width: 150,
              decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: (widget.user.avatar!=null)?NetworkImage(widget.user.avatar!):const NetworkImage("https://firebasestorage.googleapis.com/v0/b/projetfinalb2.appspot.com/o/inconnu.jpeg?alt=media&token=fe5ffbb2-f9fa-4a7a-bdc1-6a482817c9d4"),

                  )
              ),


            ),
            const SizedBox(height: 20,),
            Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),

              child: Container(
                padding: const EdgeInsets.all(20),
                height: MediaQuery.of(context).size.height/2,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  children: [
                    Text("${widget.user.prenom} ${widget.user.nom}"),
                    const SizedBox(height: 20,),
                    Text(widget.user.mail),

                  ],
                ),
              ),
            ),


          ],
        )
    );

  }

}