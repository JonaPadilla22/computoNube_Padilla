import 'package:flutter/material.dart';
import 'package:computonube_padilla/src/page1.dart';
import 'package:computonube_padilla/src/page2.dart';
import 'package:computonube_padilla/src/page3.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 02',
      initialRoute: '/Page1',
      routes: {
        '/Page1': (context) => Page1(),
        '/Page2': (context) => Page2(),
        '/Page3': (context) => Page3(),
      },
      debugShowCheckedModeBanner: false,
    );
  }
}