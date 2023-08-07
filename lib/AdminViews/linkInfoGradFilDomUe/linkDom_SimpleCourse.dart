

import 'package:flutter/material.dart';
import 'package:my_elearn_epl_application/model/allModel.dart';

import '../../backend/queryAllCourse.dart';
import '../../backend/querySimpleCourseChoose.dart';
import '../../couleurs.dart';


class LinKDomSimpleCourse extends StatefulWidget {
   const LinKDomSimpleCourse({super.key, required this.gradChoose,required this.filChoose,
   required this.domChoose,
   required this.allDomaineCoursList0,
   });
  final String gradChoose;
  final String filChoose;
  final String domChoose;
  final List<String>allDomaineCoursList0;
  
  @override
  State<LinKDomSimpleCourse> createState() => _LinKDomSimpleCourseState();
}

class _LinKDomSimpleCourseState extends State<LinKDomSimpleCourse> {
  List<String>allDomaineCoursList = [] ;
  List<String> allDomaineCoursListcopy = [];
  List<String> allSimpleCourseList0 = [];
  List<String>myAllDomaineCoursList = [];
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
          child: Text(widget.filChoose+" - "+widget.domChoose, style: TextStyle(color: Colors.white, fontSize: size.width*.065, fontWeight: FontWeight.bold),))),
        ),
        
        Center(child: Container( height: size.height*.74,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(height: size.height*.65,
                child: ListView.builder(
                  itemCount:useOwnList==1? allDomaineCoursList.length : widget.allDomaineCoursList0.length ,
                  itemBuilder: (BuildContext context, int index){
                    return Stack(
                      children: [
                                  GestureDetector(
                                    onTap: (){
                                      
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
                                      child: Text(useOwnList==1? allDomaineCoursList[index]:
                                      widget.allDomaineCoursList0[index],style: 
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
                                myAllDomaineCoursList = useOwnList == 1?allDomaineCoursList :
                                widget.allDomaineCoursList0;
                              //  deleteDomByFilInChooseDom(context, widget.filChoose,myAllDomaineCoursList[index].nameDomaine ,widget.gradChoose);
                                //registerDomByFil(context, widget.filChoose, widget.domaineList[index].nameDomaine, widget.gradChoose);
                                setState(() {
                                  showDeletefollower--;
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
                        allDomaineCoursList = await getCourseByDom(widget.domChoose, widget.filChoose, widget.gradChoose);
                         
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

                          
                        allSimpleCourseList0 = await getAllCouserDom(widget.domChoose);
                        useOwnList == 1 ? allDomaineCoursListcopy = allDomaineCoursList :
                        allDomaineCoursListcopy = widget.allDomaineCoursList0;


                        allDomaineCoursListcopy.forEach((element) {
                          setState(() {
                              allSimpleCourseList0.removeWhere((elt) => element==elt);
                          });
                        },);
                        
                          
                          setState(() {
                            showloadind =0; 
                          });
                          
                        /*  
                         Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>
                          LinkInfoGradFilDomUeMainPage2_3(filChoose: widget.filChoose,
                           gradChoose: widget.gradChoose, 
                           domaineList: allSimpleCourseList0,)));  */
                      
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