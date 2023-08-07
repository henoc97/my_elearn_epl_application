import 'package:flutter/material.dart';

import '../../backend/queryAllFiliere.dart';
import '../../couleurs.dart';
import '../../model/allModel.dart';
import 'linkInfoGradFilDomUeMainPage2.dart';


class LinkInfoGradFilDomUeMainPage extends StatefulWidget {
   const LinkInfoGradFilDomUeMainPage({super.key, required this.gradationList});
  final List<GradationMd> gradationList;
  
  @override
  State<LinkInfoGradFilDomUeMainPage> createState() => _LinkInfoGradFilDomUeMainPageState();
}

class _LinkInfoGradFilDomUeMainPageState extends State<LinkInfoGradFilDomUeMainPage> {
  List<FiliereMd> allFiliereList = [];
  int showloadind = 0;
  @override
  Widget build(BuildContext context) {
     Couleurs myColors = Couleurs();
    Size size = MediaQuery.of(context).size;
    double sizeText = size.width*.1;
    return Scaffold(
      body: Stack(children: [
        for (int t=0; t<=2;t++)
         Container(height: size.height*.14,width: size.width, decoration: BoxDecoration(gradient: myColors.linear1, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
        child: Center(child: Text("Lier les filière et leurs cours", style: TextStyle(color: Colors.white, fontSize: size.width*.065, fontWeight: FontWeight.bold),)),
        ),
        
        Center(child: Container(height: size.height*.7,
          child: ListView.builder(
            itemCount: widget.gradationList.length,
            itemBuilder: (BuildContext context, int index){
              return GestureDetector(
                onTap: () async {
                 setState(() {
                            showloadind =1; 
                          });
                 allFiliereList = await getAllFiliere("1");
                        if(allFiliereList[0]!=''){
                          setState(() {
                            showloadind =0; 
                          });
                          setState(() {
                            allFiliereList;
                          });
                           Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>
                          LinkInfoGradFilDomUeMainPage2(filiereList: allFiliereList, gradChoose: widget.gradationList[index].nameGrad,))) ; 
                        
                        }},
                child: Card(//color: Colors.blue,
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
                            child: Text(widget.gradationList[index].nameGrad,
                            style: 
                                    TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: sizeText*.48, fontWeight: FontWeight.w600)
                            ),
                            
                          ))
                          ), 
                          IconButton(onPressed: (){}, icon: Icon(Icons.more_vert))
                          ]))),
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
        ),
        ]),
    );
  }
}