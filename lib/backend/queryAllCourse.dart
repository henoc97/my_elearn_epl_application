



import 'dart:convert';

import 'package:http/http.dart' as http;

import '../model/allModel.dart';
import 'ipConfig.dart';




 Future<List<String>>  getAllCouserDom( String nameDom,)async {
    List<SimpleCourseMd> finaldatalist = [];
    List<String> finaldatalist1 = [];
     Uri uri = Uri.parse("${IpConfig().beniIp}queryAllCourseByDom.php");
    final postresponse = await http.post(uri, body: {
      'nameDom' : nameDom,
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
          "nameDomaine" : data[0][i][1],
          "nameCourse": data[0][i][2]
        });
        }
      }
     // print('dataList');
     // print(dataList);
     
     for(Map<String, dynamic> d in dataList){
      finaldatalist.add(SimpleCourseMd(
    id: int.parse(d['id']),
    nameDomaine: d['nameDomaine'], 
    nameSimpleCours:d['nameCourse'] ,
  ) 
);}
     }
    }else{
      print('error');
    }

   finaldatalist.forEach((element) {
    finaldatalist1.add(element.nameSimpleCours);
   });

 return finaldatalist1 ;
 }