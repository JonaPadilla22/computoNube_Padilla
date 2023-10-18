import 'package:flutter/material.dart';
import 'package:computonube_padilla/src/splash_screen.dart';
void main() => runApp(MyApp());
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Miniproyecto 02', 
      home: SplashScreen(), 
      debugShowCheckedModeBanner: false
    );
  }
}