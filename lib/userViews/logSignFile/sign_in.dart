
import 'package:flutter/material.dart';
import '../../backend/loginAndsignFunction.dart';
import '../../couleurs.dart';
import '../dialogFile/rigthDialog.dart';

class Sign_in extends StatefulWidget {
  const Sign_in({super.key});

  @override
  State<Sign_in> createState() => _Sign_inState();
}

class _Sign_inState extends State<Sign_in> {
  TextEditingController nameController = TextEditingController();
  TextEditingController mailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

   final _formkey = GlobalKey<FormState>();

  

  int indice = 0;

  

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

              child: SizedBox(height: size.height*.7,width: size.width*.9,
              child: Container(
                child: Form(
                  key: _formkey,
                  child: ListView(children: <Widget>[
                    
                    Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Sign in',
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
                          
                         // border: OutlineInputBorder(),
                          hintText: "Nom de L'utilisateur",
                        ),
                         validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ce champ n'a pas été rempli";
                              }
                              return null;
                            },
                      ),
                    ),
                   
                    Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        cursorHeight : 30,
                        controller: mailController,
                        decoration: InputDecoration(
                         // border: OutlineInputBorder(),
                          hintText: 'Compte Mail',
                        ),
                        validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ce champ n'a pas été rempli";
                              }
                              return null;
                            },
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          width: size.width*.9,
                          child: Container(
                            padding: EdgeInsets.fromLTRB(sizeText*.25, sizeText*.25, sizeText*.25, 0),
                            child: TextFormField(
                              cursorHeight : 30,
                              obscureText: indice % 2 == 0 ? true : false,
                              controller: passwordController,
                              decoration: InputDecoration(
                                suffixIcon: Padding(padding: EdgeInsets.only(left:sizeText*3),
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
                              //  border: OutlineInputBorder(),
                                hintText: 'Mot De Passe',
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
                        padding: EdgeInsets.fromLTRB(sizeText*.25, 0, sizeText*.25, 0),
                        child: GestureDetector(
                          onTap: () {
                           registerStd(nameController.text, mailController.text, passwordController.text);
                           // print(nameController.text);
                            //print(mailController.text);
                            //print(passwordController.text);
                  
                             if (_formkey.currentState!.validate()){
                             ShowDialog().showDialogRigth(context,'Enrégistrement réussi');
                          }
                
                          },
                          child: Container(decoration: BoxDecoration( 
                          color: clrs.couleur1,
                        borderRadius: BorderRadius.all(Radius.elliptical(75.0, 60.0))
                        ),
                            
                            child: Center(
                                child: Text(
                              'Sign in',
                              style: TextStyle(fontSize: sizeText*.7, color: Colors.white),)),),)),]),),),),),]));}}
