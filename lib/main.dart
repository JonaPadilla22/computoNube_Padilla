import 'package:computonube_padilla/src/tabs_page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 06', 
      home: TabsPage(), 
      debugShowCheckedModeBanner: false
    );
  }
}