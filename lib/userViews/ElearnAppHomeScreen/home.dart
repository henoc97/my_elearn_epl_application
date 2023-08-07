import 'package:flutter/material.dart';
import '../MyMoreViews/more_views.dart';
import '../inEachCategoCours/cours_des_categories.dart';
import '../staticLists/categories.dart';
import 'HomeScreenComponent/categorieDeCours.dart';
import 'HomeScreenComponent/greetingHomePartAtMiddle.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.name,});
  final   String name;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int count = 0;
  int setting_view = 0;
  List<String> themes = [];

  @override
  Widget build(BuildContext context) {

        Size size = MediaQuery.of(context).size;
        double sizeText = size.width*.1;
        var items = Categorie.getCategories();
       
    return
         Scaffold(
        body: Stack(//mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  
          children: <Widget>[

            Container(decoration: BoxDecoration(gradient: LinearGradient(colors:[ Color.fromARGB(90, 39, 10, 182),Color.fromARGB(255, 187, 95, 130).withOpacity(0.3),] )),),
            Column(
              children: [
                Flexible(
                  child: SizedBox( height: size.height*.45, width: size.width,
                  child: Container(decoration: BoxDecoration(image:DecorationImage( fit: BoxFit.cover,
                    image: AssetImage(count==0?'assets/photos/ec06a637d61b1c05bbbc288d8d745146.jpg':
                    count==1?"assets/photos/mechanical_1.jpg":
                    count==2? 'assets/photos/electric.jpg':
                    count==4? 'assets/photos/logistic.jpg':
                    count==5? 'assets/photos/geni_civil.webp':
                    'assets/photos/ia_bigData.jpg'
                     )) , 
                    borderRadius: BorderRadius.only(bottomRight: Radius.elliptical(40.0, 40.0),
                     bottomLeft: Radius.elliptical(40.0, 40.0),)),),),
                ),
                 Row(mainAxisAlignment: MainAxisAlignment.center,
                           children: [
                            Flexible(                                                    child:count%6!=0? IconButton(icon: Icon(Icons.arrow_back_ios_new_outlined,
                                                    color: Colors.white,size: sizeText*.9,), 
                                                   onPressed: () { 
                                                     setState(() {
                                                       count--;
                                                     });},):Container()),
                             Flexible(flex: 8,
                               child:Center(
                  child: Text(count==0?'Génie Informatique':
                  count==1?'Génie Mécanique':
                  count==2?'Génie Electrique':
                  count==3?'IA & Big Data':
                  count==4?'Logistique et Transport':
                  'Génie Civil',
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500, fontSize: sizeText*.55),),
                               ),),
                               Flexible(
                                 child: count<5? IconButton(icon: Icon(Icons.arrow_forward_ios,
                                                    color: Colors.white,size: sizeText*.9,), 
                                                   onPressed: () { 
                                 setState(() {
                                   count++;
                                 });
                                                    },):Container(),
                               )]
                         ),

                         Container(//margin: EdgeInsets.fromLTRB(sizeText*.55, sizeText*10.3, 0, sizeText*.55),
            decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(20)), gradient: LinearGradient(colors:[ Color.fromARGB(90, 39, 10, 182),Color.fromARGB(255, 187, 95, 130).withOpacity(0.3),] )),
              child: Container(decoration: BoxDecoration(color: Colors.white.withOpacity(0.7),borderRadius: BorderRadius.all(Radius.circular(20))),
              
                child: SizedBox(height: size.height*.2, width: size.width*.9,
              child: Container(
              child: GreetingHomePart(count: count, name: widget.name,)
              ),
              ),),
            ), 

             Container(
              
              child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text("Catégories",style: 
                    TextStyle(color: Colors.white, fontSize: sizeText*.45, fontWeight: FontWeight.w600)),
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                            setting_view=0;
                          });
                   Navigator.push(context, PageRouteBuilder(
                    pageBuilder:  (_, __, ___) =>More_views(
                    
                    count: count==0?0:
                    count==1?1:count==2?2:
                    count==3?3:count==4?4:
                    count==5?5:0, )));
                },
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Voir plus",style: 
                      TextStyle( color: Colors.white,fontSize: sizeText*.35, fontWeight: FontWeight.w600)),
                  ), 
                  Icon(Icons.arrow_forward_ios, color: Colors.white, size: sizeText*.4,)
                ],),
              )
             ]),),

              Container(//margin: EdgeInsets.fromLTRB(20, sizeText*16, 0, sizeText*.3),
              
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(height: size.height*.205, width: size.width,
                          child: Container(
                          child: ListView.builder(
                itemCount: 10,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index){
                return GestureDetector(
                  onTap: () {
                      
                     
                    Navigator.push(context, PageRouteBuilder(pageBuilder:  (_, __, ___) =>All_courses(
                      count: count==0?0:
                      count==1?1:count==2?2:
                      count==3?3:count==4?4:
                      count==5?5:0, )));
                  },
                  child:  Container(margin: EdgeInsets.only(right: sizeText*.22),
                    child: SizedBox(
                    height: size.height*.14, width: size.width*.33,
                    child: Cat_container(count: count, item: items[index], )//theme:  theme[index], ),
                  ),)
                );
                          }),
                          ),),
              ),)
              ],
            ),
          ])
      );
  }
}

