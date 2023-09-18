
import 'package:computonube_padilla/src/datos_recibidos.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final ctrlpeso = new TextEditingController();
  final ctrlest = new TextEditingController();
  final data = Data(peso: 0.0, estatura: 0.0);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.pink[200],
        title: Text('Miniproyecto 01'),
        centerTitle: true
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: ctrlpeso,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ingresa el peso (kg)',
                contentPadding: EdgeInsets.all(20)
              )
            ),
            SizedBox(height: 20),
            TextField(
              controller: ctrlest,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                hintText: 'Ingresa la estatura (mts)',
                contentPadding: EdgeInsets.all(20)
              )
            ),
            SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Colors.green[200],
                onPrimary: Colors.white
              ),
              child: Text('Calcular'),
              onPressed: () {
                setState(() {
                  data.peso = double.parse(ctrlpeso.text);
                  data.estatura = double.parse(ctrlest.text);
                  
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => DatosPage(data: data)));
                });
              }, 
            )
          ],
        )
      ),
    );
  }
}

class Data {
  double peso;
  double estatura;
  Data({required this.peso, required this.estatura});
}