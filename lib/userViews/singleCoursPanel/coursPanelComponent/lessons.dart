import 'package:flutter/material.dart';

import 'pdf_page.dart';
import 'video_page.dart';


class Lessons extends StatefulWidget {
  const Lessons({super.key, });
  @override
  State<Lessons> createState() => _LessonsState();
}

class _LessonsState extends State<Lessons> {
  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    double sizeText = size.width*.1;
    return Container(
      margin: EdgeInsets.only(top: sizeText),
      child: SizedBox(height: size.height*.5, width: size.width,
      child: ListView(
        shrinkWrap: true,
        children: [
          Card(//color: Colors.blue,
            child: SizedBox(height: size.height*.05,width: size.width,
            child: Text('  Fichiers : ', style: TextStyle(fontSize: sizeText*.55, fontWeight: FontWeight.w600),),
            ),),
            Card(child: SizedBox(height: size.height*.4, width: size.width,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index){
              return GestureDetector(
                onTap: () {
                Navigator.push(context, PageRouteBuilder(pageBuilder:  (_, __, ___) =>Pdf_views()));

                },
                child: Card(//color: Colors.blue,
                          child: SizedBox(height: size.height*.1,width: size.width,
                          child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Image.asset('assets/photos/adobe_acrobat_reader_480px.png')
                  ),
                  Container(child: Text("(PDF) ", style: TextStyle(fontSize: sizeText*.5, fontWeight: FontWeight.w600),),),
                 SizedBox(width: size.width*.1,
                          child: Container(child:  Image.asset('assets/photos/download_from_the_cloud_480px.png'),)),
                    
                ],
                          ),
                          ),),
              );
            }),
            ),),
             Card(//color: Colors.blue,
            child: SizedBox(height: size.height*.05,width: size.width,
            child: Text('  Vidéos : ', style: TextStyle(fontSize: sizeText*.55, fontWeight: FontWeight.w600),),
            ),),
            Card(child: SizedBox(height: size.height*.4, width: size.width,
            child: ListView.builder(
              itemCount: 5,
              shrinkWrap: true,
              itemBuilder: (context, index){
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, PageRouteBuilder(pageBuilder:  (_, __, ___) =>Video_views()));

                },
                child: Card(//color: Colors.blue,
                          child: SizedBox(height: size.height*.1,width: size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(margin: EdgeInsets.only(left: 0),
                        padding: const EdgeInsets.all(1.0),
                        child: Image.asset('assets/photos/vegas_480px.png')
                      ),
                      Container(child: Text("(VIDEO) ", style: TextStyle(fontSize: sizeText*.5, fontWeight: FontWeight.w600),),),
                      
                         SizedBox(width: size.width*.1,
                          child: Container(child:  Image.asset('assets/photos/download_from_the_cloud_480px.png'),)),
                    
                ],
                          ),
                          ),),
              );
            }),
            ),)
      
      ]),
      ),
    );
  }
}