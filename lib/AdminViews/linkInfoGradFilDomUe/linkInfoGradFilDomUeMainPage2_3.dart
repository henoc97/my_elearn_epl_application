import 'package:flutter/material.dart';

import '../../backend/insertGradFilMat.dart';
import '../../backend/queryAllDom.dart';
import '../../backend/queryDom.dart';
import '../../couleurs.dart';
import '../../model/allModel.dart';


class LinkInfoGradFilDomUeMainPage2_3 extends StatefulWidget {
   const LinkInfoGradFilDomUeMainPage2_3({super.key, required this.gradChoose, required this.filChoose, required this.domaineList});
  final String gradChoose;
  final String filChoose;
  final List<DomaineMd>domaineList;
  
  @override
  State<LinkInfoGradFilDomUeMainPage2_3> createState() => _LinkInfoGradFilDomUeMainPage2_3State();
}

class _LinkInfoGradFilDomUeMainPage2_3State extends State<LinkInfoGradFilDomUeMainPage2_3> {
  List<DomaineMd> searchList = [];
  int showAjouter = -1;
  int showAjouterfollower = 1;
  int showloadind = 0;
  int showSearchList = 0;

  @override
  Widget build(BuildContext context) {
     Couleurs myColors = Couleurs();
    Size size = MediaQuery.of(context).size;
    double sizeText = size.width*.1;
    return Scaffold(
      body: Stack(children: [
        for (int t=0; t<=2;t++)
         Container(height: size.height*.14,width: size.width, decoration: BoxDecoration(gradient: myColors.linear1, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
  
        ),
         Container(margin: EdgeInsets.fromLTRB(40, 60, 0, 0), height: size.height*.05, width: size.width*.8,
        decoration : BoxDecoration(color: Colors.white.withOpacity(0.85), borderRadius: BorderRadius.circular(15)),
        child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(width: size.width*.6,
              margin: EdgeInsets.only(left: 15, top: 20),
              child: TextFormField(
                onTap: ()  {
                  setState(() {
                    showSearchList = 1;
                  });
                },
                onChanged: (value)  {
                  if(value.length > 2 ){
                    setState(() async {
                       searchList = await getDom(value.toString());
                    });
                  
                  }
                },
                decoration: InputDecoration(
                  border:InputBorder.none,
                  hintText: "Recherche",
                  
                ),
              ),
            ),
            Container(width: 50,height: size.height*.04,
            margin: EdgeInsets.only(right: 5),
            decoration: BoxDecoration(borderRadius: BorderRadius.circular(8), color: myColors.couleur1),
              child: Icon(Icons.search, color: Colors.white,),)
          ],
        ),
        ),
        
        Center(child: Container(height: size.height*.7,
          child: ListView.builder(
            itemCount: showSearchList ==0 ? widget.domaineList.length : searchList.length,
            itemBuilder: (BuildContext context, int index){
              return Stack(
                children: [
                            Card(//color: Colors.blue,
                                child: SizedBox(height: size.height*.1,width: size.width,
                                child: Row( mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(1.0),
                        child: Image.asset('assets/photos/opened_folder_512px.png')
                      ),
                      
                      
                       SizedBox(width: size.width*.6,
                         child: Container(
                                           
                            child:  Center(
                              child: Text(widget.domaineList[index].nameDomaine,
                              style: 
                                      TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: sizeText*.48, fontWeight: FontWeight.w600)
                              ),
                              
                            ))
                            ), 
                            IconButton(onPressed: (){
                              setState(() {
                                showAjouter = index;
                                showAjouterfollower++;
                              });
                            }, icon: Icon(Icons.more_vert))
                            ]))),

                           showAjouter == index && showAjouterfollower%2==0? 
                           GestureDetector(
                            onTap: () {
                              registerDomByFil(context, widget.filChoose, widget.domaineList[index].nameDomaine, widget.gradChoose);
                              setState(() {
                                showAjouterfollower--;
                                widget.domaineList.remove(widget.domaineList[index]);
                              });
                              
                            },
                             child: Container(decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.5),
                                borderRadius: BorderRadius.circular(15)),
                                margin: EdgeInsets.fromLTRB(size.width*.65, size.height*.05, 0, 0),
                                 
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text("   Ajouter   ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                                ),
                              ),
                           ):Container()
                          ],
              );
            }),
        )),

        showloadind==1? Column(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(margin: EdgeInsets.only(bottom: 25), child: Center(child: Text('Loading....', style: TextStyle(fontSize: 40),))),
          ],
        ): Container(),
        for (int t=0; t<=2;t++)
        Container( height: size.height*.14, decoration: BoxDecoration(gradient: myColors.linear1, borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
        margin: EdgeInsets.only(top: size.height*.88),
        child: Center(child: Text("Lier les filière à leurs cours", style: TextStyle(color: Colors.white, fontSize: size.width*.065, fontWeight: FontWeight.bold))),
        ),
        ]),
    );
  }
}