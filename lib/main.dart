import 'package:flutter/material.dart';
import 'package:computonube_padilla/src/crud_page.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 14', 
      home: CrudPage(), 
      debugShowCheckedModeBanner: false
    );
  }
}