
import 'package:flutter/material.dart';
import 'package:message_app/dashboard.dart';
import 'package:message_app/functions/FirestoreHelper.dart';
import 'package:message_app/register.dart';
import 'package:message_app/variable/lib.dart';


class authentification extends StatefulWidget {
  const authentification({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    // ignore: todo
    // TODO: implement createState
    return authentificationState();
  }
}

class authentificationState extends State<authentification> {
  int _counter = 0;
  String mail = "";
  String password = "";

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(


        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text("Connexion"),

        ),
        body: Container(
          color: Colors.black,

          padding: EdgeInsets.all(20),
          child: Center(
            child: bodyPage(),
          ),
        )
    );
  }


  popUp() {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text("Erreur !!!"),
            actions: [
              ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text("OK")
              )
            ],
          );
        }
    );
  }

  Widget bodyPage() {
    return Column(

      children: [
        //Afficher un logo
        Container(

          width: 120,
          height: 120,
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            image: DecorationImage(
              fit: BoxFit.fill,
              image: NetworkImage("https://cdn-icons-png.flaticon.com/512/5158/5158652.png"),
            ),

          ),
        ),
        SizedBox(height: 20,),
        SizedBox(height: 20,),


        //Utilisateur tape son adresse mail
        TextField(
          onChanged: (value) {
            setState(() {
              mail = value;
            });
          },
          decoration: InputDecoration(
              hintText: "Entrer votre adresse mail",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )
          ),
        ),
        SizedBox(height: 20,),
        //Utilisateur
        //tape son mot de passe
        TextField(
          onChanged: (value) {
            setState(() {
              password = value;
            });
          },
          obscureText: true,
          decoration: InputDecoration(
              hintText: "Entrer votre mot de passe",
              filled: true,
              fillColor: Colors.white,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(20),
              )
          ),
        ),
        SizedBox(height: 20,),
        //Bouton de connexion
        ElevatedButton(
            style: ElevatedButton.styleFrom(
                primary: Colors.lightBlue,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)
                )
            ),
            onPressed: () {
              print("Je suis connecté");
              FirestoreHelper().Connect(mail: mail, password: password).then((value) {

                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) {
                        return dashBoard();
                      }
                  ));


              }).catchError((error) {
                popUp();
              });
            },
            child: Text("Connexion")
        ),
        SizedBox(height: 20,),
        // Lien vers une page Inscription
        InkWell(
          onTap: () {
            print("J'ai appuyé sur l'inscription");
            Navigator.push(context, MaterialPageRoute(
                builder: (context) {
                  return register();
                }
            ));
          },
          child: Text("Inscription", style: TextStyle(color: Colors.lightBlue),),
        )


      ],
    );
  }
}