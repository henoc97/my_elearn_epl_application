import 'package:flutter/material.dart';
import '../MyMoreViews/more_views_cours.dart';
import '../parametre.dart';
import '../searchFile/recherche_cours.dart';
import '../singleCoursPanel/single_ue.dart';
import '../staticLists/typeCoursList.dart';
import 'categoCoursComponent/coursBoxShower.dart';
import 'categoCoursComponent/descriptionPart.dart';

class All_courses extends StatefulWidget {
  const All_courses({super.key, required this.count//required this.theme,required this.courseslist,
  });

  final int count;
  
  @override
  State<All_courses> createState() => _All_coursesState();
}
  int setting_view=0;
   var items_cours = Types_cours.getTypes_courss();

class _All_coursesState extends State<All_courses> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sizeText = size.width*.1;
    return Scaffold(
      body: Column(children: [
        Container(
          margin: EdgeInsets.fromLTRB(0, 30, 0, 0),
          child: SizedBox(height: size.height*.06, width: size.width*.95,
                  child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)),
                   gradient: LinearGradient(colors:[ Color.fromARGB(90, 39, 10, 182),Color.fromARGB(255, 187, 95, 130).withOpacity(0.3),] ),
                   ),
                   child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       GestureDetector(
                        onTap: () {
                           Navigator.push(context, PageRouteBuilder(pageBuilder:  (_, __, ___) =>Recherche_cours(count:widget.count==0?0:
                            widget.count==1?1:widget.count==2?2:
                            widget.count==3?3:widget.count==4?4:
                            widget.count==5?5:0 ,)));
                        },
                         child: Container(//color: Colors.amber,
                          //padding: EdgeInsets.fromLTRB(0, sizeText*.3, sizeText*5, sizeText*.3),
                           child: Row(children: [
                            Icon(Icons.search, size: sizeText*.7,), 
                            Text("Recherche", style: TextStyle(fontSize: sizeText*.45, fontWeight: FontWeight.w500),)
                           ],),
                         ),
                       ),
                       GestureDetector(
                        onTap: () {
                          setState(() {
                            setting_view++;
                          });
                        },
                         child: Container(margin: EdgeInsets.only(right: sizeText*.3),
                          child: Icon(Icons.menu_rounded, size: sizeText*.7,)),
                       ), 
                     ],
                   ) ,),),), 

                    GestureDetector(
                      onTap: setting_view%2==1?(){
                          Navigator.push(context, PageRouteBuilder(pageBuilder:  (_, __, ___) =>Parametre()));
                         
                      }:() {
                        
                      },
                      child: Container(margin: EdgeInsets.fromLTRB(sizeText*5, 0, 0, 0),
                                child: setting_view%2==1? Card(elevation: 20,// color: Colors.amber,
                                  child: SizedBox(height: size.height*.05,width: size.width*.3,
                                  child: Center(child: Text("Paramètre", style: TextStyle(fontSize: sizeText*.5, fontWeight: FontWeight.w500),)),
                                  )): SizedBox(height: size.height*.06,width: size.width*.3,
                                  
                                  )),
                    ),
          
          Container(
              
              margin: EdgeInsets.fromLTRB(sizeText*.3,0, sizeText*.3, 0),
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Text("Les cours disponibles",style: 
                  TextStyle( fontSize: sizeText*.5, fontWeight: FontWeight.w600)),
              GestureDetector(
                onTap: () {
                   Navigator.push(context, PageRouteBuilder(pageBuilder:  (_, __, ___) =>More_views_cours(
                    
                  count: widget.count==0?0:
                    widget.count==1?1:widget.count==2?2:
                    widget.count==3?3:widget.count==4?4:
                    widget.count==5?5:0,  )));
                },
                child: Row(children: [
                  Text("Voir plus",style: 
                    TextStyle( fontSize: sizeText*.35, fontWeight: FontWeight.w600)), 
                  Icon(Icons.arrow_forward_ios, size: sizeText*.4,)
                ],),
              )
             ]),),
          
            Container(margin: EdgeInsets.fromLTRB(sizeText*.15, 30, 0, 20),
              
              child: SizedBox(height: size.height*.4, width: double.infinity,
            child: Container(
            child: ListView.builder(
              itemCount: 10,
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index){
              return GestureDetector(
                onTap: () {
                   setState(() {
                    
                     setting_view=0;
                   });
                Navigator.push(context, PageRouteBuilder(pageBuilder:  (_, __, ___) =>Single_ue(
                  index: widget.count==0?0:
                    widget.count==1?1:widget.count==2?2:
                    widget.count==3?3:widget.count==4?4:
                    widget.count==5?5:0, )));
          
                },
                child: Cours_Box(size: size, widget: widget, item_cours:items_cours[index],  ),
              );
            }),
            ),),),
             
        Container(
          child: Expanded(
            child: Stack(children: [
                          Container(decoration: BoxDecoration(
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(20),
                  topRight: Radius.circular(20)),
                            gradient: LinearGradient(colors:[ Color.fromARGB(90, 39, 10, 182),Color.fromARGB(255, 187, 95, 130).withOpacity(0.3),] )),),
                            DescriptionCoursShower()
            ]),
          ),
        )
      ]),
    );
  }
  
}

