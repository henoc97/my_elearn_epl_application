import 'package:flutter/material.dart';
import 'package:my_elearn_epl_application/AdminViews/linkInfoGradFilDomUe/linkInfoGradFilDomUeMainPage2_3.dart';

import '../../backend/deleteDomInChooseDom.dart';
import '../../backend/queryAllDom.dart';
import '../../backend/queryDomainByFil.dart';
import '../../backend/querySimpleCourseChoose.dart';
import '../../couleurs.dart';
import '../../model/allModel.dart';
import 'linkDom_SimpleCourse.dart';


class LinkInfoGradFilDomUeMainPage3 extends StatefulWidget {
   const LinkInfoGradFilDomUeMainPage3({super.key, required this.gradChoose,required this.filChoose,
   required this.allDomaineByFiliereList0
   });
  final String gradChoose;
  final String filChoose;
  final List<DomaineMd>allDomaineByFiliereList0;
  
  @override
  State<LinkInfoGradFilDomUeMainPage3> createState() => _LinkInfoGradFilDomUeMainPage3State();
}

class _LinkInfoGradFilDomUeMainPage3State extends State<LinkInfoGradFilDomUeMainPage3> {
  List<DomaineMd>allDomaineByFiliereList = [] ;
  
  List<DomaineMd>allDomaineByFiliereListcopy = [];
  List<DomaineMd> allDomaineList0 = [];
  List<DomaineMd>myAllDomaineByFiliereList = [];
  List<String>allDomaineCoursList0 = [];
  int showloadind = 0;
  int useOwnList = 0;
  int showDelete = -1;
  int showDeletefollower = 1;

  @override
  Widget build(BuildContext context) {
     Couleurs myColors = Couleurs();
    Size size = MediaQuery.of(context).size;
    double sizeText = size.width*.1;
    return Scaffold(
      body: Stack(children: [
        for (int t=0; t<=2;t++)
         Container( height: size.height*.14,width: size.width, decoration: BoxDecoration(gradient: myColors.linear1, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
        child: Center(child: Container(
          margin: EdgeInsets.fromLTRB(30, 20, 30, 0),
          child: Text(widget.gradChoose+" - "+widget.filChoose, style: TextStyle(color: Colors.white, fontSize: size.width*.065, fontWeight: FontWeight.bold),))),
        ),
        
        Center(child: Container( height: size.height*.74,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(height: size.height*.65,
                child: ListView.builder(
                  
                  itemCount://useOwnList==1? allDomaineByFiliereList.length : 
                  widget.allDomaineByFiliereList0.length ,
                  itemBuilder: (BuildContext context, int index){
                    return Stack(
                      children: [
                                  GestureDetector(
                                    onTap: ()async {

                           setState(() {
                            showloadind =1; 
                          });
                      allDomaineCoursList0 = await getCourseByDom(//useOwnList==1?allDomaineByFiliereList[index].nameDomaine:
                      widget.allDomaineByFiliereList0[index].nameDomaine, widget.filChoose, widget.gradChoose);
                        //  print('allDomaineByFiliereList');
                       // print(allDomaineByFiliereList);
                          setState(() {
                            showloadind =0; 
                          });
                          setState(() {
                            allDomaineCoursList0;
                          });
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>
                    LinKDomSimpleCourse(filChoose: widget.filChoose, 
                    gradChoose: widget.gradChoose, 
                    allDomaineCoursList0: allDomaineCoursList0, 
                    domChoose: useOwnList==1?allDomaineByFiliereList[index].nameDomaine:
                    widget.allDomaineByFiliereList0[index].nameDomaine ,)));  
    
                    
                  },
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
                    child: Text(useOwnList==1? allDomaineByFiliereList[index].nameDomaine:
                    widget.allDomaineByFiliereList0[index].nameDomaine,
                    style: 
                            TextStyle(color: Color.fromARGB(255, 0, 0, 0), fontSize: sizeText*.48, fontWeight: FontWeight.w600)
                    ),
                    
                  ))
                                    ), 
                                    IconButton(onPressed: (){
                                                                  setState(() {
                                    showDelete = index;
                                    showDeletefollower++;
                                                                  });
                                                                }, icon: Icon(Icons.more_vert))
                                                                ]))),
                                  ),

                             showDelete == index && showDeletefollower%2==0? 
                             GestureDetector(
                              onTap: () {
                                myAllDomaineByFiliereList = useOwnList == 1?allDomaineByFiliereList :
                                widget.allDomaineByFiliereList0;
                                deleteDomByFilInChooseDom(context, widget.filChoose,myAllDomaineByFiliereList[index].nameDomaine ,widget.gradChoose);
                                //registerDomByFil(context, widget.filChoose, widget.domaineList[index].nameDomaine, widget.gradChoose);
                                setState(() {
                                  showDeletefollower--;
                                  useOwnList == 1 ?allDomaineByFiliereList.remove(allDomaineByFiliereList[index]):
                                  widget.allDomaineByFiliereList0.remove(widget.allDomaineByFiliereList0[index]);
                                });
                                
                              },
                               child: Container(decoration: BoxDecoration(
                                  color: Colors.black.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(15)),
                                  margin: EdgeInsets.fromLTRB(size.width*.63, size.height*.05, 0, 0),
                                   
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Text("  Supprimer  ", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),),
                                  ),
                                ),
                             ):Container()

                                ],
                    );
                  }),
              ),
              Container(margin: EdgeInsets.only(left: 10, right: 10),
                child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                      GestureDetector(
                       onTap: ()async {
                         setState(() {
                            showloadind =1; 
                          });
                           setState(() {
                           useOwnList = 1;
                         });
                        allDomaineByFiliereList = await getDomByFil(widget.filChoose, widget.gradChoose);
                         
                          setState(() {
                            showloadind =0; 
                          });
                         

                       },
                        child: RotatedBox(
                          
                          quarterTurns: 0,
                          child: Image.asset("assets/photos/refresh_512px.png", scale: 7,)),
                      ),

                        GestureDetector(
                          onTap: () async{
                            setState(() {
                            showloadind =1; 
                          });

                          
                        allDomaineList0 = await getAllDom("1");
                        useOwnList == 1 ? allDomaineByFiliereListcopy = allDomaineByFiliereList :
                        allDomaineByFiliereListcopy = widget.allDomaineByFiliereList0;


                        allDomaineByFiliereListcopy.forEach((element) {
                          setState(() {
                              allDomaineList0.removeWhere((elt) => element.nameDomaine==elt.nameDomaine);
                          });
                        },);
                        
                          
                          setState(() {
                            showloadind =0; 
                          });
                          
                          
                         Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>
                          LinkInfoGradFilDomUeMainPage2_3(filChoose: widget.filChoose, gradChoose: widget.gradChoose, domaineList: allDomaineList0,)));  
                      
                          },
                          child: Image.asset("assets/photos/Plus_512px.png", scale: 7,))
                       ],),
              )
            ],
          ),
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