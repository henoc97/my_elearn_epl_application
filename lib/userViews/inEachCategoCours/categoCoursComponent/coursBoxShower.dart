import 'package:flutter/material.dart';

import '../../staticLists/typeCoursList.dart';
import '../cours_des_categories.dart';



class Cours_Box extends StatelessWidget {
  const Cours_Box({
    super.key,
    required this.size,
     required this.item_cours,
    // required this.item_theme_cours,
    //required this.theme,

    required this.widget,
    
  });

  final Size size;
   final Types_cours item_cours;
 
  final All_courses widget;
  

  @override
  Widget build(BuildContext context) {
        Size size = MediaQuery.of(context).size;
        double sizeText = size.width*.1;
    return Container(margin: EdgeInsets.only(right: sizeText*.5),
      child: SizedBox(height: size.height*.3, width: size.width*.7,
    child: Stack(

      children:[
         
        
         Container(decoration: BoxDecoration( image: DecorationImage(opacity: 0.5, fit: BoxFit.cover ,
         image: AssetImage(
             this.item_cours.cours
         )),
          borderRadius: BorderRadius.circular(15)),),
           Container(
          child:SizedBox(height: size.height*.4, width: size.width*.7,) ,
          decoration: BoxDecoration(color:Color.fromARGB(90, 39, 10, 182),
       borderRadius: BorderRadius.circular(15)),),
    
     
       Container( margin: EdgeInsets.fromLTRB(sizeText*.3, sizeText*5.7, sizeText*.3, 0),
          child: SizedBox(height: size.height*.12,width: size.width*.4,
            child: Text( widget.count==0? 'Cours sur le génie informatique ':
            widget.count==1?"Cours sur le génie mécanique":
            widget.count==2? 'Cours sur le génie électrique':
            widget.count==4? 'Cours sur le génie logistique et transport':
            widget.count==5? 'Cours sur le génie civil':
            'Cours sur IA et Big Data',style: 
              TextStyle(color: Colors.white, fontSize: sizeText*.55, fontWeight: FontWeight.w600)),
          ),
           ),
    
    ]),
    ));
  }
}