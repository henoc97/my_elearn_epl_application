
import 'package:flutter/material.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../userViews/dialogFile/rigthDialog.dart';
import 'ipConfig.dart';


Future<void> deleteDomByFilInChooseDom(BuildContext context,String name_Filiere,String name_Catego_Course, String name_Graduation)
  async{
    Uri uri = Uri.parse("${IpConfig().beniIp}deleteDomInChooseDom.php");
    final response = await http.post(uri, body: {
      'Name_Filiere' : name_Filiere,
      'Name_Catego_Course' : name_Catego_Course,
      'Name_Graduation' : name_Graduation,
      
    });
    if(response.statusCode==200){
      var data = jsonDecode(response.body) ;
      if(data['rst']=="Delete succeeded" ){
        ShowDialog().showDialogRigth(context, 
        "Suppression réussie");
      }
    }
      }
