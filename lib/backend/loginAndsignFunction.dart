


import 'dart:convert';

import 'package:http/http.dart' as http;

import 'ipConfig.dart';


Future<void> registerStd(String nameStd,String mailStd, String passwdStd)async{
    Uri uri = Uri.parse("${IpConfig().beniIp}insertStudent.php");
    final response = await http.post(uri, body: {
      'nameStd' : nameStd,
      'mailStd' : mailStd,
      'passwdStd' : passwdStd, 
    });
    if(response.statusCode==200){
      var data = jsonDecode(response.body) ;
      print(data);
    }
      }



 Future<int> logregister(String nameStdLg, String passwdStdLg) async {
     Uri uri = Uri.parse("${IpConfig().beniIp}Login.php");
    final postresponse = await http.post(uri, body: {
      'nameStdLg' : nameStdLg,
      'passwdStdLg' : passwdStdLg, 
    });
    if(postresponse.statusCode==200){
    //  print('done');
      var data =json.decode(postresponse.body);
      print(data['LogStdResponse']);
      if(data['LogStdResponse']=="1"){
           return 1 ;               
      }else{
        return 0 ;  
      } 
    }else{
       return 0 ;  
    }
  }




