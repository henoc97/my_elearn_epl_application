import 'package:flutter/material.dart';


class Instructeur extends StatelessWidget {
  const Instructeur({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sizeText = size.width*.1;
    return Container(
      margin: EdgeInsets.only(top: sizeText),
      child: SizedBox(height: size.height*.52, width: size.width,
      child: ListView(children:[Padding(
        padding: const EdgeInsets.only(left:10.0),
        child: Column(
          children: [
             Row(
               children: [
                 Text('Mr DAMALI', style: TextStyle(fontSize: sizeText*.55, fontWeight: FontWeight.w600),),
               ],
             ),
             Text("Professionnel en dévéloppement des Logiciels et éducateur", style: TextStyle(fontSize: sizeText*.3,)),
             Container(margin: EdgeInsets.only(top: sizeText*.5),
               child: Row(
                children: [
                  SizedBox(height: size.height*.16,width: size.width*.35,
                    child: Container( decoration: BoxDecoration(
                      image: DecorationImage(fit: BoxFit.fill, image: AssetImage( 'assets/photos/man.jpeg')),
                      borderRadius: BorderRadius.all(Radius.circular(10)) ),)),

                  Container(margin: EdgeInsets.only(left: 10),
                    child: SizedBox(height: size.height*.16,width: size.width*.55,
                      child: Container( child: Column( mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Row(children: [
                            Icon(Icons.star_rate),
                            Container(margin: EdgeInsets.only(left: 10),child: Text("4,5", style: TextStyle(fontSize: sizeText*.25,)))
                          ],),
                          Row(children: [
                            Icon(Icons.message_outlined),
                            Container(margin: EdgeInsets.only(left: 10),child: Text("136 Reviews", style: TextStyle(fontSize: sizeText*.25,)))
                          
                          ],),Row(children: [
                            Icon(Icons.person),
                            Container(margin: EdgeInsets.only(left: 10),child: Text("936 Students", style: TextStyle(fontSize: sizeText*.25,)))
                          
                          ],),Row(children: [
                            Icon(Icons.play_lesson_rounded),
                            Container(margin: EdgeInsets.only(left: 10),child: Text("12 Cours", style: TextStyle(fontSize: sizeText*.25,)))
                          
                          ],)
                        ],
                  
                      ), )),
                  ),
                ],
               ),
             ),
             Row(
               children: [
                 Container(margin: EdgeInsets.only(top: sizeText*.5),
                  child: Text("A propos de l'instructeurs",style: TextStyle(fontSize: sizeText*.5, fontWeight: FontWeight.w600),),),
               ],
             ),
             Row(
               children: [
                 Container(margin: EdgeInsets.only(top: 80),
                  child: Text("Réactions des étudients",style: TextStyle(fontSize: sizeText*.5, fontWeight: FontWeight.w600),),),
               ],
             )
          ],
        ),
      )] ))
      ,);
  }
}