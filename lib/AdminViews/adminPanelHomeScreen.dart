import 'package:flutter/material.dart';
import '../backend/queryAllGradation.dart';
import '../couleurs.dart';
import '../model/allModel.dart';
import 'LinkInfoGradFilDomUe/linkInfoGradFilDomUeMainPage.dart';
import 'addInfoGradFilDomUe/addInfoGradFilDomUeMainPage.dart';
import 'addProfAndCourse/addProfAndCourseMainPage.dart';
import 'linkProfAndCourse/LinkProfAndCourseMainPage.dart';
import 'staticlist/settingAdminBoxItemsList.dart';



class AdminPanel extends StatefulWidget {
  const AdminPanel({super.key});

  @override
  State<AdminPanel> createState() => _AdminPanelState();
}

class _AdminPanelState extends State<AdminPanel> {
  List<GradationMd> allGradationListrecieve =[];
  int showloadind =0;
 var boxItems = SettingAdminBoxItems.getSettingAdminBoxItems();
  @override
  Widget build(BuildContext context) {
    Couleurs myColors = Couleurs();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      body: Stack(children: [
        for (int t=0; t<=2;t++)
        Container( height: size.height*.14, decoration: BoxDecoration(gradient: myColors.linear1, borderRadius: BorderRadius.circular(30)),
        child: Center(child: Text("Panel d'administration", style: TextStyle(color: Colors.white, fontSize: size.width*.08, fontWeight: FontWeight.bold),),),
        ),

        Center(child: SizedBox(height: size.height*.42,width: size.width*.94,
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [for (int i = 0 ; i<=1; i++)
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int y = 0 ; y<=1; y++)
                GestureDetector(
                  onTap: () async {
                    if (i==0){
                      if(y==0){
                        Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>AddProfAndCourseMainPage()));
                      }
                    }
                    if (i==0){
                      if(y==1){
                        Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>LinkProfAndCourseMainPage()));
                      }
                    }
                    if (i==1){
                      if(y==0){
                        Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>AddInfoGradFilDomUeMainPage()));
                      }
                    }
                    if (i==1){
                      if(y==1){
                        setState(() {
                            showloadind =1; 
                          });
                        allGradationListrecieve = await getAllGradation("1");
                        if(allGradationListrecieve[0]!=''){
                          setState(() {
                            showloadind =0; 
                          });
                          setState(() {
                            allGradationListrecieve;
                          });
                         Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>
                          LinkInfoGradFilDomUeMainPage(gradationList:allGradationListrecieve,)));  
                        }
                        
                       
                      }
                    }
                    
                   
                  },

                  child: AdminHomeChooseBox(size: size, 
                  actionExplanation: i==0? boxItems[y].actionExplanation:
                  boxItems[y+2].actionExplanation, actionIconData:i==0? 
                  boxItems[y].actionIconData:boxItems[y+2].actionIconData, 
                  actionIconData1: i==0? boxItems[y].actionIconData1:
                  boxItems[y+2].actionIconData1, actionText:i==0? 
                  boxItems[y].actionText:boxItems[y+2].actionText, 
                  addAndLinkChanger: y,),
                ),
                
                          ],),
             
          ]),
        ),),
       showloadind==1? Column(mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Container(margin: EdgeInsets.only(bottom: 25), child: Center(child: Text('Loading....', style: TextStyle(fontSize: 40),))),
          ],
        ): Container(),

         for (int t=0; t<=2;t++)
        Container( height: size.height*.14, decoration: BoxDecoration(gradient: myColors.linear1, borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
        margin: EdgeInsets.only(top: size.height*.88),
        ),
      ],)
    );
  }
}

class AdminHomeChooseBox extends StatefulWidget {
  const AdminHomeChooseBox({
    super.key,
    required this.size,
    required this.actionIconData,
    required this.actionIconData1,
    required this.actionText,
    required this.actionExplanation,
    required this.addAndLinkChanger
  });


  final Size size;
  final String actionIconData;
  final String actionIconData1;
  final String actionText;
  final String actionExplanation;
  final int addAndLinkChanger;

  @override
  State<AdminHomeChooseBox> createState() => _AdminHomeChooseBoxState();
}

class _AdminHomeChooseBoxState extends State<AdminHomeChooseBox> {
  @override
  Widget build(BuildContext context) {
    return Container( decoration: BoxDecoration(color: Color.fromARGB(182, 255, 255, 255), borderRadius: BorderRadius.circular(15), 
    border: Border.all(color:Couleurs().couleur1, width: widget.size.width*.0065)), width: widget.size.width*.45,height: widget.size.height*.205 ,
    child:  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
            widget.addAndLinkChanger ==0? Image.asset("assets/photos/Plus_512px.png", scale: 12,):
            Image.asset("assets/photos/share_512px.png", scale: 12,),
              Image.asset("assets/photos/${widget.actionIconData}.png",  scale: 12,),
              Image.asset("assets/photos/${widget.actionIconData1}.png",  scale: 12,),
            ],
          ),
          Text(widget.actionText, style: TextStyle(fontWeight: FontWeight.bold, fontSize: widget.size.width*.048, /*color: myColors[2]*/),),
          Text(widget.actionExplanation, style: TextStyle(color: Color.fromARGB(255, 58, 56, 56))),
          
        ]),
      ),
    ),
     );
  }
}