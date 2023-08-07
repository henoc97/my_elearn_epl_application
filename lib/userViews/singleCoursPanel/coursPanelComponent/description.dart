import 'package:flutter/material.dart';

class Description extends StatelessWidget {
  const Description({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    double sizeText = size.width*.1;
    return Container(
      margin: EdgeInsets.only(left: 30,top:150 ,right: 8 ),
      child: Column(
        children: [
          Container(margin: EdgeInsets.only(right: sizeText*5),
            child: Text("Apropos du Cours" , style: 
            TextStyle(color: Colors.black, fontSize: sizeText*.55, fontWeight: FontWeight.w600),),
          ),

           Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Row( 
            children: [
              SizedBox(height: size.height*.05,width: size.width*.1,
                child: Image.asset(fit: BoxFit.fill,'assets/photos/people (1).png')),
            Text('  Professeur DAMALI', style: TextStyle(fontWeight: FontWeight.w500, fontSize: sizeText*.4,color: Color.fromARGB(255, 0, 0, 0)),)
          ],),
        ),

         Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Row( 
            children: [
                SizedBox(height: size.height*.05,width: size.width*.1,
                child: Image.asset(fit: BoxFit.fill,'assets/photos/google_play_movies_and_tv_512px.png')),                       
                 Text('  4 heures de cours en vidéo', style: TextStyle(fontWeight: FontWeight.w500, fontSize: sizeText*.4,color: Color.fromARGB(255, 0, 0, 0)),)
          ],),
        ),

         Padding(
          padding: const EdgeInsets.only(top:8.0),
          child: Row( 
            children: [
              SizedBox(height: size.height*.05,width: size.width*.1,
                child: Image.asset(fit: BoxFit.fill,'assets/photos/download_from_the_cloud_512px.png')),
            Text('  30 modules téléchargeables', style: TextStyle(fontWeight: FontWeight.w500, fontSize: sizeText*.4,color: Color.fromARGB(255, 0, 0, 0)),)
          ],),
        ),

         Container(
           child: Row( 
             children: [
               SizedBox(height: size.height*.05,width: size.width*.1,
                 child: Image.asset(fit: BoxFit.fill,'assets/photos/certificat.png')),
             Text("  Certificat d' Achèvement", style: TextStyle(fontWeight: FontWeight.w500, fontSize: sizeText*.4,color: Color.fromARGB(255, 0, 0, 0)),)
           ],),
         ),
         Container(height: size.height*.1,),
        Expanded(
          child: Container(margin: EdgeInsets.only(bottom: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            Text('£30.99',style:TextStyle(fontSize: sizeText*.5, fontWeight:FontWeight.w600) ),
            Container(decoration: BoxDecoration(color: Colors.black,borderRadius: BorderRadius.circular(15)),
              
              padding: EdgeInsets.fromLTRB(50, 20, 50, 20),
              child: Center(child: Text(style:TextStyle(color: Colors.white,fontSize: sizeText*.5) ,"Acheter le cours")),)
          ],),
          ),
        )
        ],
      ),);
  }
}