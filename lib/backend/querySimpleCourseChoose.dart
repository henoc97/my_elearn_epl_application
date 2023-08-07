





import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/allModel.dart';
import 'ipConfig.dart';




 Future<List<String>>  getCourseByDom(String nameDom, String nameFiliere, String nameGradation)async {
    List<SimpleCourseChoose> finaldatalist = [];
    List<String> finaldatalist1 = [];
     Uri uri = Uri.parse("${IpConfig().beniIp}queryCourseChooseByDom.php");
    final postresponse = await http.post(uri, body: {
      'nameDom' : nameDom,
      'nameFiliere' : nameFiliere,
      'nameGradation' : nameGradation,
      
    });
    if(postresponse.statusCode==200){
    //  print('done');
      var data =json.decode(postresponse.body);
     // print(data);

      if(data[0] == "vide1"){
       // print("finaldatalist");
        return finaldatalist1;
      }else{
        List<Map<String, dynamic>> dataList = [];
      for(int i=0 ; i<data[0].length; i++ ){
        if(data[0][i][1].length>=2) {
          dataList.add({
          "id" : data[0][i][0],
          "id1" : data[0][i][1],
          "courseName": data[0][i][2]
        });
        }
      }
     // print('dataList');
     // print(dataList);
     
     for(Map<String, dynamic> d in dataList){
      finaldatalist.add(SimpleCourseChoose(
    id: int.parse(d['id']),
    id1: int.parse(d['id1']), 
    courseName: d['courseName'] ,
  ) 
);
     }
    }
   
}

 return finaldatalist1 ;
 }