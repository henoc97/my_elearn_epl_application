import 'package:flutter/material.dart';


class Video_views extends StatefulWidget {
  const Video_views({super.key});

  @override
  State<Video_views> createState() => _Video_viewsState();
}

class _Video_viewsState extends State<Video_views> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text('VIDEO', style: TextStyle(fontSize:45 , fontWeight: FontWeight.w600, color: Color.fromARGB(255, 0, 0, 0)),),
),
    );
  }
}