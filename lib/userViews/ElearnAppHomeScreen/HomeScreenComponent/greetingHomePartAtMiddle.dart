import 'package:flutter/material.dart';
import '../../searchFile/recherche.dart';

class GreetingHomePart extends StatefulWidget {
  const GreetingHomePart({super.key, required this.count, required this.name});
  final int count;
  final String name;
  @override
  State<GreetingHomePart> createState() => _GreetingHomePartState();
}

class _GreetingHomePartState extends State<GreetingHomePart> {
  int setting_view = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sizeText = size.width*.1;
    int count = widget.count;
    return Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(children: [
                      Container(margin: EdgeInsets.only(left: sizeText*.55),
                        decoration: BoxDecoration(color: Color.fromARGB(255, 10, 94, 222), borderRadius: BorderRadius.all(Radius.circular(100))),
                        child: Icon(Icons.person, size: sizeText*.9,color: Colors.white,)),
                      Text('   Salut, '+this.widget.name,style: TextStyle(fontWeight: FontWeight.w500, fontSize: sizeText*.6),)
                  ],),
                  Text('Retrouver les cours que vous voulez apprendre', style: TextStyle(
                    fontSize: sizeText*.37,  fontWeight: FontWeight.w500),),

                  Container(child: SizedBox(height: size.height*.06, width: size.width*.8,
                  child: Container(decoration: BoxDecoration(borderRadius: BorderRadius.all(Radius.circular(8)),
                   gradient: LinearGradient(colors:[ Color.fromARGB(90, 39, 10, 182),Color.fromARGB(255, 187, 95, 130).withOpacity(0.3),] ),
                   ),
                   child:Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                     children: [
                       GestureDetector(
                        onTap: () {
                         Navigator.push(context, PageRouteBuilder(pageBuilder:  (_, __, ___) =>Recherche(count:count==0?0:
                            count==1?1:count==2?2:
                            count==3?3:count==4?4:
                            count==5?5:0, name: this.widget.name ,)));

                        },
                         child: Container(padding: EdgeInsets.fromLTRB(0, 10, 120, 10),
                         
                           child: Row(children: [
                            Icon(Icons.search, size: sizeText*.4,), 
                            Text("Recherche", style: TextStyle(fontWeight: FontWeight.w500, fontSize: sizeText*.3),)
                           ],),
                         ),
                       ),
                        
                     ],
                   ) ,),),)

                ],
              );
  }
}

