import 'package:flutter/material.dart';
import 'coursPanelComponent/brieveInfoOfCourses.dart';
import 'coursPanelComponent/description.dart';
import 'coursPanelComponent/exercices.dart';
import 'coursPanelComponent/instructeur.dart';
import 'coursPanelComponent/lessons.dart';

class Single_ue extends StatefulWidget {
  const Single_ue({super.key, required this.index, });//required this.name_course,required this.coursesPdfList});
  final index; 
  
  @override
  State<Single_ue> createState() => _Single_ueState();
}
  int count = 1;

class _Single_ueState extends State<Single_ue> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sizeText = size.width*.1;
    return Scaffold(
     body: Column(children: [
       Stack(
              children:[ 
                SizedBox( height: size.height*.4, width: size.width,
                  child:             Container(decoration: BoxDecoration(gradient: LinearGradient(colors:[ Color.fromARGB(255, 39, 10, 182),Color.fromARGB(255, 187, 95, 130).withOpacity(0.3),] )),),
                ),
                SizedBox( height: size.height*.4, width: size.width,
                child: Container(decoration: BoxDecoration(image:DecorationImage(opacity: 0.3,  fit: BoxFit.cover,
                  image: AssetImage(this.widget.index==0?'assets/photos/ec06a637d61b1c05bbbc288d8d745146.jpg':
                  this.widget.index==1?"assets/photos/mechanical_1.jpg":
                  this.widget.index==2? 'assets/photos/electric.jpg':
                  this.widget.index==4? 'assets/photos/logistic.jpg':
                  this.widget.index==5? 'assets/photos/geni_civil.webp':
                  'assets/photos/ia_bigData.jpg'))))),

                Container( margin: EdgeInsets.only(top: size.height*.2),
                  child: Column(
                    children: [
                            
                      Container(
                        margin: EdgeInsets.only(left: 20,),
                        child: Row(
                          children: [
                            Text( 'Nom du cours',style: 
                            TextStyle(color: Colors.white, fontSize: sizeText*.55, fontWeight: FontWeight.w600),),
                          ],
                        ),),
                        BrieveInfoOfCourse()
                    ],
                  ),
                ), 

                
          ]),
          Container( 
            child: SizedBox(height: size.height*.6,width: size.width,
              child: Stack(
                children:[ 
                  SizedBox( height: size.height*.4, width: size.width,
                  child:  Container()       
                ),
                  SizedBox( height: size.height*.6, width: size.width,
                  child: Container(decoration: BoxDecoration(gradient: LinearGradient(colors:[ Color.fromARGB(0, 51, 17, 221),Color.fromARGB(197, 221, 9, 90).withOpacity(0.15),] )),),
                ),
                 
                  Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                       GestureDetector(
                    onTap: () {
                      setState(() {
                        count=1;
                      });
                    },
                    child: count==1?Card(color: Color.fromARGB(255, 255, 255, 255),elevation: 20,
                      child: SizedBox(width: size.width*.23,height: size.height*.07,
                        child: Center(child: Text('Description', style: TextStyle(fontSize: sizeText*.4, fontWeight: FontWeight.w500))),
                      ),
                    ):Padding(
                      padding: const EdgeInsets.only(top:20.0, bottom: 20),
                      child: Text('Description', style: TextStyle(color: Color.fromARGB(255, 133, 123, 123), fontSize: sizeText*.27),),
                                     ),
                  ),
                   GestureDetector(
                     onTap: () {
                      setState(() {
                        count=2;
                      });
                    },
                     child:count==2?Card(color: Color.fromARGB(255, 255, 255, 255),elevation: 20,
                      child: SizedBox(width: size.width*.23,height: size.height*.07,
                        child: Center(child: Text('Leçons', style: TextStyle(fontSize: sizeText*.4, fontWeight: FontWeight.w500))),
                      ),
                    ):Text('Leçons', style: TextStyle(color: Color.fromARGB(255, 133, 123, 123), fontSize: sizeText*.27),),
                   ),
                   GestureDetector(
                     onTap: () {
                      setState(() {
                        count=3;
                      });
                    },
                     child:count==3?Card(color: Color.fromARGB(255, 255, 255, 255),elevation: 20,
                      child: SizedBox(width: size.width*.23,height: size.height*.07,
                        child: Center(child: Text('Instructeur', style: TextStyle(fontSize: sizeText*.4, fontWeight: FontWeight.w500))),
                      ),
                    ):Text('Instructeur', style: TextStyle(color: Color.fromARGB(255, 133, 123, 123), fontSize: sizeText*.27),),
                   ),
                   GestureDetector(
                     onTap: () {
                      setState(() {
                        count=4;
                      });
                    },
                     child:  count==4?Card(color: Color.fromARGB(255, 255, 255, 255),elevation: 20,
                      child: SizedBox(width: size.width*.23,height: size.height*.07,
                        child: Center(child: Text('Exercices', style: TextStyle(fontSize: sizeText*.4, fontWeight: FontWeight.w500),)),
                      ),
                    ):Text('Exercices', style: TextStyle(color: Color.fromARGB(255, 133, 123, 123), fontSize: sizeText*.27),),
                   ),
                  ]),
                  
                count==1?Description(size: size):
                count==2?Lessons():
                count==3?Instructeur():
                Exercices(),  
     ]),
            ),
          ),
     ],),
    );
  }
}

