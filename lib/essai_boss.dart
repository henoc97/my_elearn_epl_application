import 'package:flutter/material.dart';

class FavoriteCount extends StatefulWidget {
  const FavoriteCount({super.key});

  @override
  State<FavoriteCount> createState() => _FavoriteCountState();
}

class _FavoriteCountState extends State<FavoriteCount> {
  int _count = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Center(
          child: GestureDetector(
            onTap:() {
              setState(() {
                 _count++;
              print(_count); 
              });
            
            },
            child: Icon( _count %2 == 0? Icons.favorite_border: Icons.favorite_sharp,
            color:_count %2 == 0? Colors.black:Colors.red ,
           size: _count %2 == 0? 50:250 ,),
          ),
        ),
      ),
    );

  }
}