

import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/allModel.dart';
import 'ipConfig.dart';




 Future<List<GradationMd>>  getAllGradation( String allowqueryallgrad)async {
    List<GradationMd> finaldatalist = [];
     Uri uri = Uri.parse("${IpConfig().beniIp}queryAllGradation.php");
    final postresponse = await http.post(uri, body: {
      'allowqueryallgrad' : allowqueryallgrad,
    });
    if(postresponse.statusCode==200){
    //  print('done');
      var data =json.decode(postresponse.body);
      List<Map<String, dynamic>> dataList = [];
      for(int i=0 ; i<data[0].length; i++ ){
        if(data[0][i][1].length>=5) {
          dataList.add({
          "id" : data[0][i][0],
          "nameGrad" : data[0][i][1],
        });
        }
      }
     // print('dataList');
     
     for(Map<String, dynamic> d in dataList){
      finaldatalist.add(new GradationMd(
    id: int.parse(d['id']),
    nameGrad: d['nameGrad'],
  )
);
     }
    }
    return finaldatalist ;
}


 