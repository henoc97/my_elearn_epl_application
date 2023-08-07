import 'package:flutter/material.dart';



class DescriptionCoursShower extends StatelessWidget {
  const DescriptionCoursShower({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
     Size size = MediaQuery.of(context).size;
    double sizeText = size.width*.1;
    return SingleChildScrollView(
      child: Container( margin: EdgeInsets.fromLTRB(20, 30, 10, 10),
        child: Column(mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text('Description : ', style: TextStyle(fontSize: sizeText*.5, fontWeight: FontWeight.w600),),
            Text(style: TextStyle(fontSize: sizeText*.45,fontWeight: FontWeight.w500),'Flutter adopts the physics and behavior of applications corresponding to the target platform,Flutter adopts the physics and behavior of applications corresponding to the target platform,Flutter adopts the physics and behavior of applications corresponding to the target platform,Flutter adopts the physics and behavior of applications corresponding to the target platform.'),
              
          ],
        )),
    );
  }
}

