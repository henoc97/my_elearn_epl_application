import 'package:flutter/material.dart';

import '../../couleurs.dart';
import 'insertgradation.dart';

class AddInfoGradFilDomUeBoxItems {
  final String actionIconData;
  final String actionText;

  AddInfoGradFilDomUeBoxItems({required this.actionIconData, required this.actionText,});
  
  static List<AddInfoGradFilDomUeBoxItems> getSettingAdminBoxItems(){

    List<AddInfoGradFilDomUeBoxItems> boxItems = <AddInfoGradFilDomUeBoxItems>[] ;


    boxItems.add(AddInfoGradFilDomUeBoxItems(actionIconData: "google_sketchup_512px", actionText: 'Graduation', ));
    boxItems.add(AddInfoGradFilDomUeBoxItems(actionIconData: "document_512px", actionText: 'Filière', ));
    boxItems.add(AddInfoGradFilDomUeBoxItems(actionIconData: "bookmark_512px", actionText: 'Domaine',));
    boxItems.add(AddInfoGradFilDomUeBoxItems(actionIconData: "windows_notepad_512px", actionText: 'Matière', ));
  
    return boxItems;
  }
}

class AddInfoGradFilDomUeMainPage extends StatefulWidget {
  const AddInfoGradFilDomUeMainPage({super.key});

  @override
  State<AddInfoGradFilDomUeMainPage> createState() => _AddInfoGradFilDomUeMainPageState();
}

class _AddInfoGradFilDomUeMainPageState extends State<AddInfoGradFilDomUeMainPage> {
  var boxItems = AddInfoGradFilDomUeBoxItems.getSettingAdminBoxItems();
  @override
  Widget build(BuildContext context) {
     Couleurs myColors = Couleurs();
    Size size = MediaQuery.of(context).size;
    
    return Scaffold(
      body: Stack(children: [
        for (int t=0; t<=2;t++)
        Container(height: size.height*.14,width: size.width, decoration: BoxDecoration(gradient: myColors.linear1, borderRadius : BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
        child: Container(margin: EdgeInsets.only(top: size.height*.047, left: size.height*.06), child: Text("Ajout des informations Graduation-Filière-Matière", style: TextStyle(color: Colors.white, fontSize: size.width*.065, fontWeight: FontWeight.bold),)),
        ),
        Center(child: SizedBox(height: size.height*.42,width: size.width*.94,
          child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [for (int i = 0 ; i<=1; i++)
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                for (int y = 0 ; y<=1; y++)
                GestureDetector(
                  onTap: () {
                    if (i==0){
                      if(y==0){
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>InsertGradPage(y: y, x: i,)));
                      }
                    }
                    if (i==0){
                      if(y==1){
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>InsertGradPage(y: y, x: i,)));
                      }
                    }
                    if (i==1){
                      if(y==0){
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>InsertGradPage(y: y, x: i,)));
                      }
                    }
                    if (i==1){
                      if(y==1){
                      Navigator.push(context, PageRouteBuilder(pageBuilder: (_,__,___)=>InsertGradPage(y: y, x: i,)));
                      }
                    }
                    
                   
                  },

                  child: AdminHomeChooseBox(size: size, 
                  actionIconData:i==0? 
                  boxItems[y].actionIconData:boxItems[y+2].actionIconData, 
                  actionText:i==0? 
                  boxItems[y].actionText:boxItems[y+2].actionText, 
                  ),
                ),
                
                          ],),
             
          ]),
        ),),
        for (int t=0; t<=2;t++)
        Container( height: size.height*.14, decoration: BoxDecoration(gradient: myColors.linear1, borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
        margin: EdgeInsets.only(top: size.height*.88),
        ),
      ],
      
      ));
  }
}





class AdminHomeChooseBox extends StatefulWidget {
  const AdminHomeChooseBox({
    super.key,
    required this.size,
    required this.actionIconData,
   
    required this.actionText,
   
   
  });


  final Size size;
  final String actionIconData;
  final String actionText;
  
  @override
  State<AdminHomeChooseBox> createState() => _AdminHomeChooseBoxState();
}

class _AdminHomeChooseBoxState extends State<AdminHomeChooseBox> {
  @override
  Widget build(BuildContext context) {
    return Container( decoration: BoxDecoration(color: Color.fromARGB(182, 255, 255, 255), borderRadius: BorderRadius.circular(15), 
    border: Border.all(color:Couleurs().couleur1, width: widget.size.width*.0065)), width: widget.size.width*.45,height: widget.size.height*.205 ,
    child:  Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Image.asset("assets/photos/${widget.actionIconData}.png",  scale: 9,),
        Text(widget.actionText, style: TextStyle(fontWeight: FontWeight.bold, fontSize: widget.size.width*.048, /*color: myColors[2]*/),),
        
      ]),
    ),
     );
  }
}