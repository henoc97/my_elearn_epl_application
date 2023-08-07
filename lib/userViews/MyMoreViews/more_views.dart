import 'package:flutter/material.dart';

class More_views extends StatefulWidget {
  const More_views({super.key, required this.count,});

    final int count;

  @override
  State<More_views> createState() => _More_viewsState();
}

class _More_viewsState extends State<More_views> {
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
        child: Text(widget.count==0?'Génie Informatique':
              widget.count==1?'Génie Mécanique':
              widget.count==2?'Génie Electrique':
              widget.count==3?'IA & Big Data':
              widget.count==4?'Logistique et Transport':
              'Génie Civil',
              style: TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontWeight: FontWeight.w500, fontSize: sizeText*.55),),
      ),),
      body: Container(
        child: Stack(children: [

          Container(decoration: BoxDecoration(gradient: LinearGradient(colors:[ Color.fromARGB(90, 39, 10, 182),Color.fromARGB(255, 187, 95, 130).withOpacity(0.3),] )),),

          ListView.builder(
            
              shrinkWrap: true,
              itemBuilder: (context, index){
              return GestureDetector(
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
                                     
                      child:  Text(widget.count==0?'Catégories de cours : Génie informatique':
                            widget.count==1?'Catégories de cours : Génie mécanique':
                            widget.count==2?'Catégories de cours : Génie Electrique':
                            widget.count==3?'Catégories de cours : IA & Big Data':
                            widget.count==4?'Catégories de cours : Logistique et Transport':
                            'Catégories de cours : Génie Civil',style: 
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

 