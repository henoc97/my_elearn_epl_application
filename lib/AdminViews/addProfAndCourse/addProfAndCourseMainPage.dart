import 'package:flutter/material.dart';
import '../../couleurs.dart';
import '../staticlist/settingAddProfAndCourseBoxItemsList.dart';


class AddProfAndCourseMainPage extends StatefulWidget {
  const AddProfAndCourseMainPage({super.key});

  @override
  State<AddProfAndCourseMainPage> createState() => _AddProfAndCourseMainPageState();
}

class _AddProfAndCourseMainPageState extends State<AddProfAndCourseMainPage> {
  var boxItems = SettingAddProfAndCourseBoxItems.getSettingAddProfAndCourseBoxItems();
  @override
  Widget build(BuildContext context) {
    Couleurs myColors = Couleurs();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(children: [
        for (int t=0; t<=2;t++)
         Container(height: size.height*.14,width: size.width, decoration: BoxDecoration(gradient: myColors.linear1, borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
        child: Container(margin: EdgeInsets.only(top: size.height*.047, left: size.height*.02), child: Text("Ajout des professeurs et leurs cours", style: TextStyle(color: Colors.white, fontSize: size.width*.065, fontWeight: FontWeight.bold),)),
        ),
        Center(child: SizedBox(height: size.height*.7, width: size.width*.92,
        child: Column(children: [
          Flexible(child: Column(children: [
            Text("Ajout des professeurs", style: TextStyle(color: myColors.couleur1, fontSize: size.width*.065, fontWeight: FontWeight.bold)),
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
              for(int i = 0; i<= 1 ; i++)
              AddProfAndHisDescription( size: size, actionIconData: boxItems[i].actionIconData,  actionText: boxItems[i].actionText,)
            ],)
          ],)),
          Flexible(flex: 2, child: Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(margin: EdgeInsets.only(left: 8), child: Text("Ajout des cours, exercices", style: TextStyle(color: myColors.couleur1, fontSize: size.width*.065, fontWeight: FontWeight.bold))),
            for(int y=0;y<=1;y++)
            Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              for(int z=0;z<=1;z++)
              AddProfAndHisDescription( actionIconData:y==0? boxItems[z+2].actionIconData:boxItems[z+4].actionIconData,  size: size, actionText:y==0? boxItems[z+2].actionText:boxItems[z+4].actionText,)
            ],)
          ],))
        ]),
        )),
        for (int t=0; t<=2;t++)
        Container( height: size.height*.14, decoration: BoxDecoration(gradient: myColors.linear1, borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
        margin: EdgeInsets.only(top: size.height*.88),
        ),
        ]),
    );
  }
}



class AddProfAndHisDescription extends StatefulWidget {
  const AddProfAndHisDescription({
    super.key,
    required this.size,
    required this.actionIconData,
    
    required this.actionText, 
  });


  final Size size;
  final String actionIconData;
  
  final String actionText;

  @override
  State<AddProfAndHisDescription> createState() => _AddProfAndHisDescriptionState();
}

class _AddProfAndHisDescriptionState extends State<AddProfAndHisDescription> {
  @override
  Widget build(BuildContext context) {
    return Container( decoration: BoxDecoration(color: Color.fromARGB(182, 255, 255, 255), borderRadius: BorderRadius.circular(15), 
    border: Border.all(color:Couleurs().couleur1, width: widget.size.width*.0065)), width: widget.size.width*.4,height: widget.size.height*.17 ,
    child:  SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(children: [
          Image.asset("assets/photos/${widget.actionIconData}.png",  scale: 9,),
          Text(widget.actionText, style: TextStyle(fontWeight: FontWeight.bold, fontSize: widget.size.width*.048, /*color: myColors[2]*/),),
          
        ]),
      ),
    ),
     );
  }
}