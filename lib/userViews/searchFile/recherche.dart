import 'package:flutter/material.dart';
import '../ElearnAppHomeScreen/HomeScreenComponent/greetingHomePartAtMiddle.dart';

class Recherche extends StatefulWidget {
   Recherche({super.key, required this.count, required this.name});
  final int count;
  final String name;
  @override
  State<Recherche> createState() => _RechercheState();
}

class _RechercheState extends State<Recherche> {

  int setting_view = 0;
  @override
  Widget build(BuildContext context) {
    
    Size size = MediaQuery.of(context).size;
    double sizeText = size.width*.1;

    return Scaffold(
           body: Stack(
             children:[ 
               Container(decoration: BoxDecoration(gradient: LinearGradient(colors:[ Color.fromARGB(90, 39, 10, 182),Color.fromARGB(255, 187, 95, 130).withOpacity(0.3),] )),),
              Column(
               children: [
                 Container(margin: EdgeInsets.fromLTRB(sizeText*.2, sizeText*.65, sizeText*.2, sizeText*.2),
              decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), gradient: LinearGradient(colors:[ Color.fromARGB(90, 39, 10, 182),Color.fromARGB(255, 187, 95, 130).withOpacity(0.3),] )),
                child: Container(decoration: BoxDecoration(color: Color.fromARGB(255, 255, 255, 255).withOpacity(0.7),borderRadius: BorderRadius.all(Radius.circular(20))),
                
                  child: SizedBox(height: size.height*.2, width: size.width*.9,
                child: Container(
                child: GreetingHomePart(count: widget.count, name: widget.name,),
                ),
                ),),
              ), 
                
                      Container(height: size.height*.3,
                        child:ListView.builder(
                          itemBuilder: (BuildContext context, int index){
                          return  GestureDetector(
                            onTap: () {
              
                },
                            child: Card(//color: Colors.blue,
                            child: SizedBox(height: size.height*.1,width: size.width,
                            child: Row(
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(1.0),
                                              child: Image.asset('assets/photos/opened_folder_512px.png')
                                            ),
                          
                          
                                             SizedBox(width: size.width*.6,
                                               child: Container(//color: Colors.amber,
                                       
                                                child:  Text(this.widget.count==0?'Catégories de cours :Génie informatique':
                              this.widget.count==1?'Catégories de cours : Génie Mécanique':
                              this.widget.count==2?'Catégories de cours : Génie Electrique':
                              this.widget.count==3?'Catégories de cours : IA & Big Data':
                              this.widget.count==4?'Catégories de cours : Logistique et Transport':
                              'Catégories de cours : Génie Civil',style: 
                                  TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: sizeText*.5, fontWeight: FontWeight.w600)),),
                                             )
                                          ],
                            ),
                            ),),
                          ); 
                        })
                      )
               ],
             ),
           ]),
    );
  }
  
   
}

