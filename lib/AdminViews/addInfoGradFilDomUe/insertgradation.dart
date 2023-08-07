import 'package:flutter/material.dart';

import '../../backend/insertGradFilMat.dart';
import '../../couleurs.dart';


class InsertGradPage extends StatefulWidget {
  const InsertGradPage({required this.x, required this.y ,super.key});
  final int x;
  final int y;
  @override
  State<InsertGradPage> createState() => _InsertGradPageState();
}

class _InsertGradPageState extends State<InsertGradPage> {
  
  
  @override
  Widget build(BuildContext context) {
    Couleurs myColors = Couleurs();
      Size size = MediaQuery.of(context).size;
      double sizeText = size.width*.1;

    return Scaffold(
      body: Stack(children: [
        for (int t=0; t<=2;t++)
        Container(height: size.height*.14,width: size.width, decoration: BoxDecoration(gradient: myColors.linear1, borderRadius : BorderRadius.only(bottomLeft: Radius.circular(30), bottomRight: Radius.circular(30))),
        child: Center(child: Text("Ajout des informations", style: TextStyle(color: Colors.white, fontSize: size.width*.065, fontWeight: FontWeight.bold),)),
        ),
       
        Container(margin: EdgeInsets.fromLTRB(sizeText*.55, sizeText*3.5, 0, 0),
            decoration: BoxDecoration(color: Colors.white.withOpacity(0.7),
            borderRadius: BorderRadius.all(Radius.circular(10))),

              child: SizedBox(height: size.height*.6,width: size.width*.9,
              child: Container(
                child: SingleChildScrollView(
                  child: Center(child: (widget.x==0 && widget.y==0)? InsertGradaPart():
                  (widget.x==0 && widget.y==1)? InsertFilierePart():
                  (widget.x==1 && widget.y==0)? InsertDomainePart():InsertMatierePart()
                  )
                )))),

        for (int t=0; t<=2;t++)
        Container( height: size.height*.14, decoration: BoxDecoration(gradient: myColors.linear1, borderRadius: BorderRadius.only(topLeft: Radius.circular(30),topRight: Radius.circular(30))),
        margin: EdgeInsets.only(top: size.height*.88),
        ),
      ],
      
      ));
  }
}




class InsertGradaPart extends StatefulWidget {
  const InsertGradaPart({super.key});

  @override
  State<InsertGradaPart> createState() => _InsertGradaPartState();
}

class _InsertGradaPartState extends State<InsertGradaPart> {
   TextEditingController nameGradController = TextEditingController();
   
  final _formkey0 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Couleurs myColors = Couleurs();
      Size size = MediaQuery.of(context).size;
      double sizeText = size.width*.1;
    return Column(
      children: [
        Container(
                        alignment: Alignment.center,
                        padding: EdgeInsets.all(10),
                        child: Text(
                          'Graduations',
                          style: TextStyle(
                              fontSize: sizeText,
                              fontWeight: FontWeight.w700,
                              color: myColors.couleur1,),
                        )),
                    Form(
                      key:_formkey0,
                      child: Container(
                        padding: EdgeInsets.all(10),
                        child: TextFormField(
                          cursorHeight : 30,
                          controller: nameGradController,
                          decoration: InputDecoration(
                            border: OutlineInputBorder(),
                            hintText: "Nom de la graduation",
                          ),    
                           validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return "Ce champ n'a pas été rempli";
                                }
                                return null;
                             }
                        ),
                      ),
                    ),
                    Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      ElevatedButton(onPressed: (){
                        if (_formkey0.currentState!.validate()){
                          registergradation(context, nameGradController.text);
                        nameGradController.clear();
                        }
                        
                      }, child: 
                      Container( width: 100, child: Center(child: Text("Valider", 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      )))),
                      ],
                    ),
      ],
    );
  }
}

class InsertFilierePart extends StatefulWidget {
  const InsertFilierePart({super.key});

  @override
  State<InsertFilierePart> createState() => _InsertFilierePartState();
}

class _InsertFilierePartState extends State<InsertFilierePart> {
   TextEditingController nameFilController = TextEditingController();
   
  final _formkey1 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
     Couleurs myColors = Couleurs();
      Size size = MediaQuery.of(context).size;
      double sizeText = size.width*.1;
    return Column(children: [
      Form(
                      key: _formkey1,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Filières',
                                style: TextStyle(
                                    fontSize: sizeText,
                                    fontWeight: FontWeight.w700,
                                    color: myColors.couleur1,),
                              )),
                            Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        cursorHeight : 30,
                        controller: nameFilController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Nom de la Filière",
                        ),    
                         validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ce champ n'a pas été rempli";
                              }
                              return null;
                           }
                      ),
                    ),Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      ElevatedButton(onPressed: (){
                        if (_formkey1.currentState!.validate()){
                          registerFiliere(context, nameFilController.text);
                        nameFilController.clear();
                        }
                        
                      }, child: 
                      Container( width: 100, child: Center(child: Text("Valider", 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      )))),
                      ],
                    ),
                        ],
                      ),
                    ),
    ],);
  }
}

class InsertDomainePart extends StatefulWidget {
  const InsertDomainePart({super.key});

  @override
  State<InsertDomainePart> createState() => _InsertDomainePartState();
}

class _InsertDomainePartState extends State<InsertDomainePart> {
   TextEditingController nameDomController = TextEditingController();
   TextEditingController descripDomController = TextEditingController();

 
  final _formkey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Couleurs myColors = Couleurs();
      Size size = MediaQuery.of(context).size;
      double sizeText = size.width*.1;
    return Column(children: [
      Form(
                      key: _formkey2,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Domaines',
                                style: TextStyle(
                                    fontSize: sizeText,
                                    fontWeight: FontWeight.w700,
                                    color: myColors.couleur1,),
                              )),
                             Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        cursorHeight : 30,
                        controller: nameDomController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Nom du domaine",
                        ),    
                         validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ce champ n'a pas été rempli";
                              }
                              return null;
                           }
                      ),
                    ),

                      Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        cursorHeight : 30,
                        controller: descripDomController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Description du domaine",
                        ),    
                         validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ce champ n'a pas été rempli";
                              }
                              return null;
                           }
                      ),),

                      Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      ElevatedButton(onPressed: (){
                         if (_formkey2.currentState!.validate()){
                          registerMatiere(context,nameDomController.text, descripDomController.text );
                          nameDomController.clear();
                          descripDomController.clear();
                        }
                       
                      }, child: 
                      Container( width: 100, child: Center(child: Text("Valider", 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      )))),
                      ],
                    ),

                        ],
                      ),
                    ),
    ],);
  }
}

class InsertMatierePart extends StatefulWidget {
  const InsertMatierePart({super.key});

  @override
  State<InsertMatierePart> createState() => _InsertMatierePartState();
}

class _InsertMatierePartState extends State<InsertMatierePart> {
     TextEditingController nameDomController1 = TextEditingController();
   TextEditingController nameMatController = TextEditingController();

 
  final _formkey2 = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Couleurs myColors = Couleurs();
      Size size = MediaQuery.of(context).size;
      double sizeText = size.width*.1;
    return Column(children: [
      Form(
                      key: _formkey2,
                      child: Column(
                        children: [
                          Container(
                              alignment: Alignment.center,
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Matière',
                                style: TextStyle(
                                    fontSize: sizeText,
                                    fontWeight: FontWeight.w700,
                                    color: myColors.couleur1,),
                              )),
                             Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        cursorHeight : 30,
                        controller: nameDomController1,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Nom du domaine",
                        ),    
                         validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ce champ n'a pas été rempli";
                              }
                              return null;
                           }
                      ),
                    ),

                      Container(
                      padding: EdgeInsets.all(10),
                      child: TextFormField(
                        cursorHeight : 30,
                        controller: nameMatController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "Description de la Matière",
                        ),    
                         validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "Ce champ n'a pas été rempli";
                              }
                              return null;
                           }
                      ),),

                      Row(mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                      ElevatedButton(onPressed: (){
                         if (_formkey2.currentState!.validate()){
                          registerMatiere(context,nameDomController1.text, nameMatController.text );
                          nameDomController1.clear();
                          nameMatController.clear();
                        }
                       
                      }, child: 
                      Container( width: 100, child: Center(child: Text("Valider", 
                      style: TextStyle(fontWeight: FontWeight.bold, fontSize: 17),
                      )))),
                      ],
                    ),

                        ],
                      ),
                    ),
    ],);
  }
}