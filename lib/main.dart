import 'package:computonube_padilla/src/listview_page.dart';
import 'package:flutter/material.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 16', 
      home: ListViewPage(), 
      debugShowCheckedModeBanner: false
    );
  }
}