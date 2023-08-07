import 'package:flutter/material.dart';

import 'pdf_page.dart';



class Exercices extends StatelessWidget {
  const Exercices({super.key,});//required this.coursesPdfList});
  //final List <PDF_db> coursesPdfList; 

  @override
  Widget build(BuildContext context) {
   Size size = MediaQuery.of(context).size;
    double sizeText = size.width*.1;
    return Container(
      margin: EdgeInsets.only(top: sizeText*1.7),
      //color: Colors.blue,
      child: SizedBox(height: size.height*.5, width: size.width,
      child: Column(
         children: [
          Card(//color: Colors.blue,
            child: SizedBox(height: size.height*.05,width: size.width,
            child: Text('  Fichiers : ', style: TextStyle(fontSize: sizeText*.55, fontWeight: FontWeight.w600),),
            ),),
            Card(child: ListView.builder(
             // itemCount: coursesPdfList.length,
              shrinkWrap: true,
              itemBuilder: (context, index){
              return GestureDetector(
                onTap: () {
                Navigator.push(context, PageRouteBuilder(pageBuilder:  (_, __, ___) =>Pdf_views()));

                },
                child: Card(//color: Colors.blue,
                          child: SizedBox(height: size.height*.1,width: size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                        padding: const EdgeInsets.all(1.0),
                        child: Image.asset('assets/photos/adobe_acrobat_reader_480px.png')
                      ),
                      Container(child: Text("(EXO) ", style: TextStyle(fontSize: sizeText*.5, fontWeight: FontWeight.w600),),),
                      
                         SizedBox(width: size.width*.1,
                          child: Container(child:  Image.asset('assets/photos/download_from_the_cloud_480px.png'),)),
                    
                ],
                          ),
                          ),),
              );
            }),),
   
      ],),
      ),
    );
  }
}