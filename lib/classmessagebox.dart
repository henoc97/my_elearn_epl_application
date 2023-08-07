
import 'package:flutter/material.dart';

import 'AdminViews/adminPanelHomeScreen.dart';
import 'couleurs.dart';


class MessageAlertBox {
  MessageAlertBox({required this.size});
  Size size;
  Couleurs myColors = Couleurs();
  int indice = 0;
  TextEditingController hideCodeController = TextEditingController();

   void showDialogToConfirmDelete(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Message"),
            content: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  
                  child:  Text('Etes vous sûr de la suppression ?',
                  style: TextStyle( fontWeight: FontWeight.w600,fontSize: size.width*.034),
                  )),
                
                Image.asset("assets/photos/trash____96px.png", color: Colors.red, scale: 3,)
              ],
            ),
            actions: <Widget>[
               TextButton(
                child: Text("Réfuser   ",style: 
                            TextStyle(
                              shadows: [for (int i = 0; i<= 6; i++)
                                  Shadow(color:Color.fromARGB(255, 5, 204, 18),
                                  blurRadius: i * 10,
                                   )
                              ],
                              color: Colors.white, fontSize: size.width*.05, fontWeight: FontWeight.w600),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
          
              TextButton(
                child: Text("    Valider",style: 
                            TextStyle(
                              shadows: [for (int i = 0; i<= 6; i++)
                                  Shadow(color:  Colors.red,
                                  blurRadius: i * 10,
                                   )
                              ],
                              color: Colors.white, fontSize: size.width*.05, fontWeight: FontWeight.w600),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }







void showDialogToConfirmDownload(BuildContext context) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Message"),
            content: Row(
              
              children: [
                Container(
                  
                  child:  Text('Etes vous sûr du téléchargement ? ',
                  style: TextStyle( fontWeight: FontWeight.w600, fontSize: size.width*.034),
                  )),
                
                Image.asset("assets/photos/downloading_updates_96px.png",color: Colors.green, scale: 3,)
              ],
            ),
            actions: <Widget>[
              TextButton(
                child: Text("Réfuser  ",style: 
                            TextStyle(
                              shadows: [for (int i = 0; i<= 6; i++)
                                  Shadow(color: Colors.red,
                                  blurRadius: i * 10,
                                   )
                              ],
                              color: Colors.white, fontSize: size.width*.05, fontWeight: FontWeight.w600),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
              Container(width: 8,),
              TextButton(
                child: Text("    Valider",style: 
                            TextStyle(
                              shadows: [for (int i = 0; i<= 6; i++)
                                  Shadow(color:  Color.fromARGB(255, 5, 204, 18),
                                  blurRadius: i * 10,
                                   )
                              ],
                              color: Colors.white, fontSize: size.width*.05, fontWeight: FontWeight.w600),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
            ],
          );
        },
      );
    }








     void showDialogToConfirmAdmin(BuildContext context) {
      double sizeText = size.width*.1;
      final _formkey = GlobalKey<FormState>();
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Message"),
            content: SizedBox(height: size.height*.1,
              child: Form(
                key: _formkey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      
                      child:  Text('Confirmez votre statut',
                      style: TextStyle( fontWeight: FontWeight.w600,fontSize: size.width*.04),)),
                    Container(padding: EdgeInsets.only(left: 5), height: size.height*.05, decoration: BoxDecoration(gradient: myColors.linear1, borderRadius: BorderRadius.circular(10)),
                      child: Center(
                        child: TextFormField(
                          decoration: InputDecoration.collapsed(hintText: "Code Secret"),
                          controller: hideCodeController,
                           
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            actions: <Widget>[
               TextButton(
                child: Text("Annuler   ",style: 
                            TextStyle(
                              shadows: [for (int i = 0; i<= 6; i++)
                                  Shadow(color:myColors.couleur2,
                                  blurRadius: i * 10,
                                   )
                              ],
                              color: Colors.white, fontSize: size.width*.05, fontWeight: FontWeight.w600),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
          
              TextButton(
                child: Text("    Valider",style: 
                            TextStyle(
                              shadows: [for (int i = 0; i<= 6; i++)
                                  Shadow(color:  myColors.couleur1,
                                  blurRadius: i * 10,
                                   )
                              ],
                              color: Colors.white, fontSize: size.width*.05, fontWeight: FontWeight.w600),),
                onPressed: () {
                  if(hideCodeController.text == "henoc"){
                    Navigator.push(context, PageRouteBuilder(
                                pageBuilder:  (_, __, ___) => AdminPanel()));
                                
                  }else{
                     Navigator.of(context).pop();
                  }
                  hideCodeController.clear();
                },
                
              ),
            ],
          );
        },
      );
    }



}


/*class ShowDialogToConfirmAdmin extends StatefulWidget {
  const ShowDialogToConfirmAdmin({super.key});

  @override
  State<ShowDialogToConfirmAdmin> createState() => _ShowDialogToConfirmAdminState();
}

class _ShowDialogToConfirmAdminState extends State<ShowDialogToConfirmAdmin> {
  TextEditingController hideCodeController = TextEditingController();
  int indice = 0 ;
  Couleurs myColors = Couleurs();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sizeText = size.width*.1;
    return Container(margin: EdgeInsets.fromLTRB(sizeText*1.6, sizeText*5, 0, 0),
       decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(25)),
       height: size.height*.25,
       width: size.width*.7,
            child:Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              Text("Message",style: TextStyle( fontWeight: FontWeight.w400,fontSize: size.width*.07),),

              SizedBox(height: size.height*.1,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    
                    child:  Text('Confirmez votre statut',
                    style: TextStyle( fontWeight: FontWeight.w600,fontSize: size.width*.04),)),
                  Container(margin: EdgeInsets.fromLTRB(5, 0, 5, 5), padding: EdgeInsets.only(left: 5), height: size.height*.05, decoration: BoxDecoration(gradient: myColors.linear1, borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: TextFormField(
                        decoration: InputDecoration(hintText: "Code Secret",
                        suffixIcon: Padding(padding: EdgeInsets.only(left:sizeText*3),
                                child:IconButton(
                                  onPressed: () { indice++; print(indice);},
                          icon: (indice % 2 == 0
                              ? Icon(Icons.key)
                              : Icon(Icons.remove_red_eye_outlined)), 
                        ),)),
                        controller: hideCodeController,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
               TextButton(
                child: Text("Annuler   ",style: 
                            TextStyle(
                              shadows: [for (int i = 0; i<= 6; i++)
                                  Shadow(color:myColors.couleur2,
                                  blurRadius: i * 10,
                                   )
                              ],
                              color: Colors.white, fontSize: size.width*.05, fontWeight: FontWeight.w600),),
                onPressed: () {
                  Navigator.of(context).pop();
                },
              ),
          
              TextButton(
                child: Text("    Valider",style: 
                            TextStyle(
                              shadows: [for (int i = 0; i<= 6; i++)
                                  Shadow(color:  myColors.couleur1,
                                  blurRadius: i * 10,
                                   )
                              ],
                              color: Colors.white, fontSize: size.width*.05, fontWeight: FontWeight.w600),),
                onPressed: () {
                  if(hideCodeController.text == "henoc"){
                    Navigator.push(context, PageRouteBuilder(
                                pageBuilder:  (_, __, ___) => AdminPanel()));
                  }
                },
              ),
            ],
            )
            ],),
    );}}*/