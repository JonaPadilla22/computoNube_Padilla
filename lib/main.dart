import 'package:computonube_padilla/src/splash_screen.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miniproyecto 01', 
      home: SplashScreen(), 
      debugShowCheckedModeBanner: false
    );
  }
}