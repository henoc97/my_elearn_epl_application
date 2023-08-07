import 'package:flutter/material.dart';

import '../../staticLists/categories.dart';


class Cat_container extends StatefulWidget {
   Cat_container({super.key, 
    required this.count,
    required this.item,
   // required this.index, 
   // required this.theme,
  });
  final Categorie item;
  final int count;
  //final int index;
 // final Theme_course_db theme;

  @override
  State<Cat_container> createState() => _Cat_containerState();
}

class _Cat_containerState extends State<Cat_container> {

  
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
        double sizeText = size.width*.1;
    return Stack(children:[ 
      Container(decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), 
      image: DecorationImage(fit: BoxFit.fill, opacity: 0.3,image: AssetImage(widget.item.cats))),),
      Container(decoration: BoxDecoration(color:Color.fromARGB(90, 39, 10, 182),
       borderRadius: BorderRadius.circular(15)),),
       Container(child:  Padding(
         padding: const EdgeInsets.fromLTRB(8, 8, 0, 0),
         child: Text(widget.count==0?'Catégories de cours : Génie Informatique'://${widget.theme.theme_des_course}':
              widget.count==1?'Catégories de cours : Génie Mécanique':// ${widget.theme.theme_des_course}':
              widget.count==2?'Catégories de cours : Génie Electrique ':
              widget.count==3?'Catégories de cours : IA & Big Data':
              widget.count==4?'Catégories de cours : Logistique & Transportà':
                'Catégories de cours : Génie Civil',style: 
                    TextStyle(color: Colors.white, fontSize: sizeText*.45, fontWeight: FontWeight.w600)),
       ),)
       ]);

       
  }

 
}
