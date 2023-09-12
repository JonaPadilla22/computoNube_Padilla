import 'package:flutter/material.dart';

class Page2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.amberAccent,
      appBar: AppBar(
        backgroundColor: Colors.blueGrey,
        title: Text('Página 2'),
        centerTitle: true 
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              child: Text('Atrás'),
              onPressed: () {
                Navigator.of(context).pop();
              }, 
            )
          ],
        ),
      ),
    );
  }
}