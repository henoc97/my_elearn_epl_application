import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../userViews/dialogFile/rigthDialog.dart';
import 'ipConfig.dart';

//registergradation
  Future<void> registergradation(BuildContext context, String name_Graduation)async{
    Uri uri = Uri.parse("${IpConfig().beniIp}insertgradation.php");
    final response = await http.post(uri, body: {
      'Name_Graduation' : name_Graduation,
      
    });
    if(response.statusCode==200){
      var data = jsonDecode(response.body) ;
      if(data['rst']=="Insertion succeeded" ){
        ShowDialog().showDialogRigth(context, "Insertion réussie");
      }
    }
      }

//registerFiliere
      Future<void> registerFiliere(BuildContext context, String nameFiliere)async{
    Uri uri = Uri.parse("${IpConfig().beniIp}insertFiliere.php");
    final response = await http.post(uri, body: {
      'nameFiliere' : nameFiliere,
       
    });
    if(response.statusCode==200){
      var data = jsonDecode(response.body) ;
      if(data['rst']=="Insertion succeeded" ){
        ShowDialog().showDialogRigth(context, "Insertion réussie");
      }
      }}

//registerMatiere
     registerMatiere(BuildContext context, String nameMatiere,String description)async{
    Uri uri = Uri.parse("${IpConfig().beniIp}insertcouravailableofue.php");
    final response = await http.post(uri, body: {
      "nameMatiere" : nameMatiere,
      "description" : description,
       
    });
    if(response.statusCode==200){
      var data = jsonDecode(response.body) ;
      print(response.body);
      if(data['rst']=="Insertion succeeded" ){
        ShowDialog().showDialogRigth(context, "Insertion réussie");
        return true;
      }
     
    }}
      

//registerDomByFil
  Future<void> registerDomByFil(BuildContext context,String name_Filiere,String name_Catego_Course, String name_Graduation)
  async{
    Uri uri = Uri.parse("${IpConfig().beniIp}insertDomInChooseDomByFil.php");
    final response = await http.post(uri, body: {
      'Name_Filiere' : name_Filiere,
      'Name_Catego_Course' : name_Catego_Course,
      'Name_Graduation' : name_Graduation,
      
    });
    if(response.statusCode==200){
      var data = jsonDecode(response.body) ;
      if(data['rst']=="Insertion succeeded" ){
        ShowDialog().showDialogRigth(context, "Insertion réussie");
      }
    }
      }
