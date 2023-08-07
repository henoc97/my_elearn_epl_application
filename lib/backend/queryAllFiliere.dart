

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/allModel.dart';
import 'ipConfig.dart';




 Future<List<FiliereMd>>  getAllFiliere( String allowqueryallfiliere)async {
    List<FiliereMd> finaldatalist = [];
     Uri uri = Uri.parse("${IpConfig().beniIp}queryAllFiliere.php");
    final postresponse = await http.post(uri, body: {
      'allowqueryallfiliere' : allowqueryallfiliere,
    });
    if(postresponse.statusCode==200){
    //  print('done');
      var data =json.decode(postresponse.body);
      //print(data);
      List<Map<String, dynamic>> dataList = [];
      for(int i=0 ; i<data[0].length; i++ ){
        if(data[0][i][1].length>=5) {
          dataList.add({
          "id" : data[0][i][0],
          "nameFiliere" : data[0][i][1],
        });
        }
      }
      //print('dataList');
      //print(dataList);
     
     for(Map<String, dynamic> d in dataList){
      finaldatalist.add(FiliereMd(
    id: int.parse(d['id']),
    namefil: d['nameFiliere'],
  )
);
     }
    }
    return finaldatalist ;
}


 