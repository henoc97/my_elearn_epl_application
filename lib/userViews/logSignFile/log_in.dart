import 'dart:convert';

import 'package:flutter/material.dart';

import '../../couleurs.dart';
import '../ElearnAppHomeScreen/home.dart';
import '../dialogFile/rigthDialog.dart';
import 'sign_in.dart';
import 'package:http/http.dart' as http;


class Log extends StatefulWidget {
  const Log({super.key});

  @override
  State<Log> createState() => _LogState();
}

class _LogState extends State<Log> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  int  indice = 0;
  
  logregister(String nameStdLg, String passwdStdLg) async {
    Uri uri = Uri.parse("http://192.168.43.232/Login.php");
    final postresponse = await http.post(uri, body: {
      'nameStdLg' : nameStdLg,
      'passwdStdLg' : passwdStdLg, 
    });
    if(postresponse.statusCode==200){
    //  print('done');
      var data =json.decode(postresponse.body);
      print(data['LogStdResponse']);
      if(data['LogStdResponse']=="1"){
          Navigator.push(context, PageRouteBuilder(
        pageBuilder:  (_, __, ___) =>MyHomePage(name: nameController.text, )));
                                        
      }else{
        ShowDialog().showDialogWrongidentity(context); 
      } 
    }else{
      return 0 ;  
    }
  }

    
  @override
  Widget build(BuildContext context) {
    Couleurs clrs = Couleurs();
   
     
    Size size = MediaQuery.of(context).size;
    double sizeText = size.width*.1;
   
    return Scaffold(
        
        body: Stack(
          children: [
            Container(decoration: BoxDecoration(gradient: LinearGradient(colors:[ Color.fromARGB(90, 39, 10, 182),Color.fromARGB(255, 187, 95, 130).withOpacity(0.3),] )),),

            Container(margin: EdgeInsets.fromLTRB(sizeText*.55, sizeText*3.5, 0, 0),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.all(Radius.circular(10))),

              child: SizedBox(height: size.height*.6,width: size.width*.9,
              child: Container(
                child: Form(
                  key: _formkey,
                  child: ListView(children: <Widget>[
                    
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Log in',
                          style: TextStyle(
                              fontSize: sizeText,
                              fontWeight: FontWeight.w700,
                              color: clrs.couleur1,),
                        )),
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        cursorHeight : 30,
                        controller: nameController,
                        decoration: InputDecoration(
                          hintText: "Nom de L'utilisateur",
                        ),    
                         validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ce champ n'a pas été rempli";
                              }
                              return null;
                           }
                      ),
                    ),
                   
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width * .9,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(sizeText*.25, sizeText*.25, sizeText*.25, 0),
                            child: TextFormField(
                              cursorHeight : 30,
                              obscureText: indice % 2 == 0 ? true : false,
                              controller: passwordController,
                              decoration: InputDecoration(
                                
                                hintText: 'Mot De Passe',
                                suffixIcon: Padding(padding: EdgeInsets.only(left:sizeText*3.2),
                                child:IconButton(
                          icon: (indice % 2 == 0
                              ? Icon(Icons.key)
                              : Icon(Icons.remove_red_eye_outlined)),
                          onPressed: (){
                            setState(() {
                              indice++;
                            });
                          },
                        ) ,),
                              ),
                              validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ce champ n'a pas été rempli";
                              }
                              return null;
                            },
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: size.height * .06,
                    ),
                    SizedBox(
                      height: size.height * .03,
                    ),
                    Container(
                        height: sizeText,
                        padding: EdgeInsets.fromLTRB(sizeText*.25, 0, sizeText*.25, 0),
                        child: GestureDetector(
                          onTap: () {
                          
                            if (_formkey.currentState!.validate()){
                             // print(logregister(nameController.text, passwordController.text).toString());
                              logregister(nameController.text, passwordController.text);
                          

                              }
                          },
                          child: Container( decoration: BoxDecoration( 
                          color: clrs.couleur1,
                        borderRadius: BorderRadius.all(Radius.elliptical(75.0, 60.0))
                        ),
                            child: Center(
                                child: Text(
                              'Log in',
                              style: TextStyle(fontSize: sizeText*.7, color: Colors.white),
                            )),
                          ),
                        )),
                   Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text('Pas de compte ?', style: TextStyle(
                                  fontSize: sizeText*.35,
                                  fontWeight: FontWeight.w500,
                                  ), ),
                            GestureDetector(
                              onTap: () {
                                 Navigator.push(context, PageRouteBuilder(
                                pageBuilder:  (_, __, ___) =>Sign_in()));
                              },
                              child: Text(
                                'Sign in',
                                style: TextStyle(
                                    fontSize: sizeText*.7,
                                    fontWeight: FontWeight.w700,
                                    color: clrs.couleur1,),),),],)),]),),),),),]));}

}
