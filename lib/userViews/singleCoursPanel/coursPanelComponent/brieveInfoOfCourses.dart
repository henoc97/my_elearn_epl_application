import 'package:flutter/material.dart';


class BrieveInfoOfCourse extends StatelessWidget {
  const BrieveInfoOfCourse({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double sizeText = size.width*.1;
    return Container(  margin: EdgeInsets.only(left: 20,),
      child: Column(
        children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row( 
            children: [
            Icon(Icons.update, color: Color.fromARGB(143, 255, 255, 255),), 
            Text('Dernière mise à jour', style: TextStyle(fontSize: sizeText*.27,color: Color.fromARGB(143, 255, 255, 255)),)
          ],),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row( 
            children: [
            Icon(Icons.book_sharp, color: Color.fromARGB(143, 255, 255, 255),), 
            Text('30 Modules', style: TextStyle(fontSize: sizeText*.27,color: Color.fromARGB(143, 255, 255, 255)),)
          ],),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row( 
            children: [
            Icon(Icons.person_2_rounded, color: Color.fromARGB(143, 255, 255, 255),), 
            Text('Professeur DAMALI', style: TextStyle(fontSize: sizeText*.27,color: Color.fromARGB(143, 255, 255, 255)),)
          ],),
        )
      ],),
    );
  }
}

