import 'package:flutter/material.dart';


class LinkProfAndCourseMainPage extends StatefulWidget {
  const LinkProfAndCourseMainPage({super.key});

  @override
  State<LinkProfAndCourseMainPage> createState() => _LinkProfAndCourseMainPageState();
}

class _LinkProfAndCourseMainPageState extends State<LinkProfAndCourseMainPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('LinkProfAndCourseMainPage', style: TextStyle(fontSize: 35, fontWeight: FontWeight.bold),)),
    );
  }
}