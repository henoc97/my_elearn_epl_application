

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/allModel.dart';
import 'ipConfig.dart';




 Future<List<DomaineMd>>  getAllDom( String allowquery,)async {
    List<DomaineMd> finaldatalist = [];
     Uri uri = Uri.parse("${IpConfig().beniIp}queryAllDomain.php");
    final postresponse = await http.post(uri, body: {
      'allowquery' : allowquery,
    });
    if(postresponse.statusCode==200){
    //  print('done');
      var data =json.decode(postresponse.body);
     // print(data);

     
        List<Map<String, dynamic>> dataList = [];
      for(int i=0 ; i<data[0].length; i++ ){
        if(data[0][i][1].length>=2) {
          dataList.add({
          "id" : data[0][i][0],
          "nameDomaine" : data[0][i][1],
          "descriptionDom": data[0][i][2]
        });
        }
      }
     // print('dataList');
     // print(dataList);
     
     for(Map<String, dynamic> d in dataList){
      finaldatalist.add(DomaineMd(
    id: int.parse(d['id']),
    nameDomaine: d['nameDomaine'], 
    descripDom: d['descriptionDom'] ,
  ) 
);
     }
    }else{
      print('error');
    }
   

 return finaldatalist ;
 }