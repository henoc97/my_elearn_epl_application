import 'package:flutter/material.dart';
import 'package:my_elearn_epl_application/couleurs.dart';

import '../classmessagebox.dart';
import 'staticLists/settingBoxItemList.dart';




class Parametre extends StatefulWidget {
  const Parametre({super.key});

  @override
  State<Parametre> createState() => _ParametreState();
}

class _ParametreState extends State<Parametre> {
  var settingBoxItems = SettingBoxItems.getSettingBoxItems();
  int showDialogToConfirmAdminShower = 0;
  @override
  Widget build(BuildContext context) {
    
    Couleurs  myColors = Couleurs();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      
      appBar: AppBar(backgroundColor:myColors.couleur1 ,
        title: Text("Parametre", style: TextStyle(fontSize: size.width*.08),)),
        body: Stack(
          children: [
            //Container(decoration: BoxDecoration(gradient: myColors.linear1 )),
            SingleChildScrollView(
              child: Wrap(
                children: 
                  [Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(mainAxisAlignment:MainAxisAlignment.spaceEvenly ,
                      children: [
                        Flexible(child: Column(children: [
                          for(int i = 0 ; i<=3; i++) GestureDetector(
                            child: SettingCildBox(actionExplanation: settingBoxItems[i].actionExplanation, actionIconData: settingBoxItems[i].actionIconData, actionText: settingBoxItems[i].actionText, /*myColors: myColors,*/ size: size,))
                        
                        
                        ])),
                        Container(width: size.width*.03,),
                        Flexible(child: Column(children: [
                           for(int i = 4 ; i<settingBoxItems.length; i++) GestureDetector(
                            onTap: () {
                              if(i == settingBoxItems.length-1){
                               MessageAlertBox(size: size). showDialogToConfirmAdmin(context);
                              }
                            },
                            child: SettingCildBox(actionExplanation: settingBoxItems[i].actionExplanation, actionIconData: settingBoxItems[i].actionIconData, actionText: settingBoxItems[i].actionText, /*myColors: myColors*/ size: size,))
                        ]))
                      ],
                    ),
                  ),
                ],
              ),
            ),
            //showDialogToConfirmAdminShower%2==0? Container() :  ShowDialogToConfirmAdmin()
          ],
        ),
    );
  }
}

class SettingCildBox extends StatelessWidget {
  const SettingCildBox({
    super.key,
    required this.size,
    required this.actionIconData,
    required this.actionText,
    required this.actionExplanation,
  });

  final Size size;
  final String actionIconData;
  final String actionText;
  final String actionExplanation;

  @override
  Widget build(BuildContext context) {
    return Container(margin: EdgeInsets.fromLTRB(0, size.width*.05, 0, 0), decoration: BoxDecoration(borderRadius: BorderRadius.circular(15), 
    border: Border.all(color: Couleurs().couleur1,width: size.width*.005)), width: size.width*.45, child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(children: [
        Image.asset("assets/photos/$actionIconData.png",  scale: 6,),
        Text(actionText, style: TextStyle(fontWeight: FontWeight.bold, fontSize: size.width*.048, /*color: myColors[2]*/),),
        Text(actionExplanation, style: TextStyle(color: Color.fromARGB(255, 58, 56, 56))),
        
      ]),
    ),);
  }
}






