import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:message_app/authenfication.dart';
import 'package:message_app/functions/FirestoreHelper.dart';
import 'package:message_app/variable/lib.dart';
import 'package:message_app/model/Utilisateur.dart';
import 'package:file_picker/file_picker.dart';


class myDrawer extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return myDrawerState();
  }

}

class myDrawerState extends State<myDrawer>{

  late String uid;
  late Uint8List? byteData;
  late String fileName;
  late String urlImage;
  String newprenom="";
  String newnom ="";
  PopNom(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          if(Platform.isIOS){
            return CupertinoAlertDialog(
              title: Text("Quel nouveau Nom voulez-vous ?"),
              content : TextField(
                onChanged: (value){
                  setState(() {
                    newnom = value;
                  });
                },
                decoration: InputDecoration(
                    hintText: "Entrez le nouveau nom",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
              actions: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Annuler")
                ),

                ElevatedButton(
                  onPressed: (){
                    Map<String,dynamic> map ={
                      "NOM": newnom,
                    };
                    FirestoreHelper().updateUser(monProfil.id, map);
                    Navigator.pop(context);
                  },
                  child: Text("Sauvegarder"
                  ),
                )

              ],
            );
          }
          else
          {
            return AlertDialog(
              title: Text("Quel nouveau Nom voulez-vous ?"),
              content : TextField(
                onChanged: (value){
                  setState(() {
                    newnom = value;
                  });
                },
                decoration: InputDecoration(
                    hintText: "Entrez le nouveau nom",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
              actions: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Annuler")
                ),

                ElevatedButton(
                  onPressed: (){
                    Map<String,dynamic> map ={
                      "NOM": newnom,
                    };
                    FirestoreHelper().updateUser(monProfil.id, map);
                    Navigator.pop(context);
                  },
                  child: Text("Sauvegarder"),
                )

              ],

            );
          }

        }
    );

  }
  PopPrenom(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          if(Platform.isIOS){
            return CupertinoAlertDialog(
              title: Text("Quel nouveau Prenom voulez-vous ?"),
              content : TextField(
                onChanged: (value){
                  setState(() {
                    newprenom = value;
                  });
                },
                decoration: InputDecoration(
                    hintText: "Entrez le nouveau prenom",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
              actions: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Annuler")
                ),

                ElevatedButton(
                  onPressed: (){
                    Map<String,dynamic> map ={
                      "PRENOM": newprenom,
                    };
                    FirestoreHelper().updateUser(monProfil.id, map);
                    Navigator.pop(context);
                  },
                  child: Text("Sauvegarder"),
                )

              ],
            );
          }
          else
          {
            return AlertDialog(
              title: Text("Quel nouveau Prenom voulez-vous ?"),
              content : TextField(
                onChanged: (value){
                  setState(() {
                    newprenom = value;
                  });
                },
                decoration: InputDecoration(
                    hintText: "Entrez le nouveau prenom",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20),
                    )
                ),
              ),
              actions: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Annuler")
                ),

                ElevatedButton(
                  onPressed: (){
                    Map<String,dynamic> map ={
                      "PRENOM": newprenom,
                    };
                    FirestoreHelper().updateUser(monProfil.id, map);
                    Navigator.pop(context);
                  },
                  child: Text("Sauvegarder"),
                )

              ],

            );
          }

        }
    );

  }

  PopImage(){
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context){
          if(Platform.isIOS){
            return CupertinoAlertDialog(
              title: Text("Souhaitez-vous utiliser cette photo comme profil ?"),
              content: Image.memory(byteData!),
              actions: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Annuler")
                ),

                ElevatedButton(
                  onPressed: (){
                    FirestoreHelper().stockageImage(fileName, byteData!).then((String lienImage){
                      setState(() {
                        urlImage = lienImage;
                      });
                    });
                    Map<String,dynamic> map ={
                      "AVATAR": urlImage,
                    };
                    FirestoreHelper().updateUser(monProfil.id, map);
                    Navigator.pop(context);
                    //enregitrer notre image dans la base de donn??e
                  },
                  child: Text("Enregitrement"),
                )

              ],
            );
          }
          else
          {
            return AlertDialog(
              title: Text("Souhaitez-vous utiliser cette photo comme profil ?"),
              content: Image.memory(byteData!),
              actions: [
                ElevatedButton(
                    onPressed: (){
                      Navigator.pop(context);
                    },
                    child: Text("Annuler")
                ),

                ElevatedButton(
                  onPressed: (){
                    FirestoreHelper().stockageImage(fileName, byteData!).then((String lienImage){
                      setState(() {
                        urlImage = lienImage;
                      });
                    });
                    Map<String,dynamic> map ={
                      "AVATAR": urlImage,
                    };
                    FirestoreHelper().updateUser(monProfil.id, map);
                    Navigator.pop(context);
                    //enregitrer notre image dans la base de donn??e
                  },
                  child: Text("Enregitrement"),
                )

              ],

            );
          }

        }
    );
  }

  importerImage() async{
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      withData: true,
      type: FileType.image,
    );
    if(result !=null){
      setState(() {
        byteData = result.files.first.bytes;
        fileName = result.files.first.name;
      });
      PopImage();
    }



  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    FirestoreHelper().getIdentifiant().then((String identifiant){
      setState(() {
        uid = identifiant;
        FirestoreHelper().getUtilisateur(uid).then((Utilisateur user){
          setState(() {
            monProfil = user;
          });
        });
      });
    });




    return Container(
        padding: EdgeInsets.all(20),
        color: Colors.black,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width/2,
        child: Center(
          child: Column(
            children: [
              SizedBox(height: 100,),
              InkWell(
                child: Container(
                  height: 100,
                  width: 100,
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.fill,
                          image: (monProfil.avatar == null)?
                          NetworkImage("https://voitures.com/wp-content/uploads/2017/06/Kodiaq_079.jpg.jpg"):
                          NetworkImage(monProfil.avatar!)
                      )
                  ),
                ),
                onTap: (){
                  //Afficher nos photos
                  importerImage();

                },
              ),
              SizedBox(height: 20,),
              Text("Cliquez sur le prenom ou nom pour le modifier !",
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 12.0,

                ),
              ),
              SizedBox(height: 20,),
              InkWell(
                child: Text("Prenom : ${monProfil.prenom}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {PopPrenom();},
              ),
              SizedBox(height: 20,),
              InkWell(
                child: Text("Nom : ${monProfil.nom}",
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                onTap: () {PopNom();},
              ),
              SizedBox(height: 20,),
              Text(monProfil.mail,
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 20,),
              ElevatedButton(
                  onPressed: (){
                    FirestoreHelper().signOut();
                    Navigator.push(context, MaterialPageRoute(
                        builder: (context){
                          return authentification();
                        }
                    ));
                  },
                  child: Text("Sign Out"))



            ],
          ),
        )
    );

  }

}