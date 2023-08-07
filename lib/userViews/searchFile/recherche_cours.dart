import 'package:flutter/material.dart';

class Recherche_cours extends StatefulWidget {
  const Recherche_cours({super.key, required this.count,});

  final int count;

  @override
  State<Recherche_cours> createState() => _Recherche_coursState();
}

class _Recherche_coursState extends State<Recherche_cours> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
           body: Center(child: Text( widget.count==0?'Recherche sur : Cours sur le génie informatique':
        widget.count==1?"Recherche sur : Cours sur le génie mécanique":
        widget.count==2? 'Recherche sur : Cours sur le génie électrique':
        widget.count==4? 'Recherche sur : Cours sur le génie logistique et transport':
        widget.count==5? 'Recherche sur : Cours sur le génie civil':
        'Recherche sur : Cours sur IA et Big Data', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w600, color: Color.fromARGB(255, 0, 0, 0)),),
),
    );
   
  }
}