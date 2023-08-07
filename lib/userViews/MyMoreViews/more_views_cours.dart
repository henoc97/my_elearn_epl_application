import 'package:flutter/material.dart';

import '../singleCoursPanel/single_ue.dart';



class More_views_cours extends StatefulWidget {
  const More_views_cours({super.key, required this.count,});//required this.theme,});

    final int count;
    // final String theme;
  
  
  @override
  State<More_views_cours> createState() => _More_views_coursState();
}

class _More_views_coursState extends State<More_views_cours> {

  

    

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    double sizeText = size.width*.1;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        foregroundColor: Colors.black,
        backgroundColor: Color.fromARGB(255, 255, 255, 255),
        title: Center(
        child: Text(this.widget.count==0?'Génie Informatique':
              this.widget.count==1?'Génie Mécanique':
              this.widget.count==2?'Génie Electrique':
              this.widget.count==3?'IA & Big Data':
              this.widget.count==4?'Logistique et Transport':
              'Génie Civil',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500, fontSize: sizeText*.55),),
      ),),
      body: Container(
        child: Stack(children: [

          Container(decoration: BoxDecoration(gradient: LinearGradient(colors:[ Color.fromARGB(90, 39, 10, 182),Color.fromARGB(255, 187, 95, 130).withOpacity(0.3),] )),),

          ListView.builder(
             // itemCount: this.widget.theme_course_list.length,
              shrinkWrap: true,
              itemBuilder: (context, index){
              return GestureDetector(
                onTap: () {
                Navigator.push(context, PageRouteBuilder(pageBuilder:  (_, __, ___) =>Single_ue(
                    index: this.widget.count==0?0:
                    this.widget.count==1?1:this.widget.count==2?2:
                    this.widget.count==3?3:this.widget.count==4?4:
                    this.widget.count==5?5:0,)));// name_course: null, coursesPdfList: [], )));

                },
                child: Card(//color: Colors.blue,
                          child: SizedBox(height: size.height*.1,width: size.width,
                          child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(1.0),
                    child: Image.asset('assets/photos/scaler_academy_240px.png')
                  ),


                   SizedBox(width: size.width*.6,
                     child: Container(//color: Colors.amber,
                                     
                      child:  Text(this.widget.count==0?'Cours '+  ': ':// this.widget.theme_course_list[index].theme_des_course:
                            this.widget.count==1?'cours : Génie Mécanique':
                            this.widget.count==2?'cours : Génie Electrique':
                            this.widget.count==3?'cours : IA & Big Data':
                            this.widget.count==4?'cours : Logistique et Transport':
                            'cours : Génie Civil',style: 
                                TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: sizeText*.48, fontWeight: FontWeight.w600)),),
                   )
                ],
                          ),
                          ),),
              );
            }),
          
              
        ]),
      ),
    );
  }
}

                                                            