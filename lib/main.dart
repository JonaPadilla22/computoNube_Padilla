import 'package:computonube_padilla/src/bottom_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 07', 
      home: BottomNavigatorPage(), 
      debugShowCheckedModeBanner: false
    );
  }
}