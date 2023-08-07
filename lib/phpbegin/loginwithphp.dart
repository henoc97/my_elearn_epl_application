import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../../couleurs.dart';

class Loginphp extends StatefulWidget {
  const Loginphp({super.key});

  @override
  State<Loginphp> createState() => _LoginphpState();
}

class _LoginphpState extends State<Loginphp> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formkey = GlobalKey<FormState>();
  void login(String name, String pwd)async{
    Uri uri = Uri.parse("http://192.168.43.232/logphp.php");
    final response = await http.get(uri);
    if(response.statusCode==200){
      var data = jsonDecode(response.body);
      print(data);
    }
      }
  int  indice = 0;
     
  @override
  Widget build(BuildContext context) {
    Couleurs clrs = Couleurs();
   
     
    Size size = MediaQuery.of(context).size;
    double sizeText = size.width*.1;
   
    return Scaffold(
        
        body: Stack(
          children: [
            Container(decoration: BoxDecoration(gradient: LinearGradient(colors:[ Color.fromARGB(90, 39, 10, 182),Color.fromARGB(255, 187, 95, 130).withOpacity(0.3),] )),),

            SingleChildScrollView(
              child: Container(margin: EdgeInsets.fromLTRB(sizeText*.55, sizeText*3.5, 0, 0),
              decoration: BoxDecoration(color: Colors.white.withOpacity(0.7),
              borderRadius: BorderRadius.all(Radius.circular(10))),
            
                child: SizedBox(height: size.height*.6,width: size.width*.9,
                child: Container(
                  child: Form(
                    key: _formkey,
                    child: Column(children: <Widget>[
                      
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
                              login('name', 'pwd');
                              //login(nameController.text, passwordController.text);
                              print(nameController.text);
                              print(passwordController.text);
                               if (_formkey.currentState!.validate()){
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
                             
          ])),]),),),),),
            ),]));}

}
