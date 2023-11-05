import 'package:computonube_padilla/src/table_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
    [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown]
  );
  runApp(MyApp());
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Practica 18', 
      home: TablePage(), 
      debugShowCheckedModeBanner: false
    );
  }
}