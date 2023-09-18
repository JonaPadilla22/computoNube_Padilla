import 'package:flutter/material.dart';
import 'package:computonube_padilla/src/home_page.dart';

class DatosPage extends StatelessWidget {
  final Data data;
  DatosPage({required this.data});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('IMC'),
        centerTitle: true
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: get(data),
        ),
      ),
    );
  }
}

get(data) {
  double imc = getIMC(data.peso, data.estatura);

  return getElements(data, imc);
}

double getIMC(double peso, double estatura) {
  return (peso / (estatura*estatura));
}

getElements(data, double imc) {
  List<Widget> elements = [
    Text('Peso: ${data.peso}kgs'),
    Text('Estatura: ${data.estatura}mts'),
    Text('IMC: ${imc.toStringAsFixed(2)}', style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)),
  ];

  String message = "";
  String imgName = "";

  if(imc < 18) {
    message = "Peso Bajo";
    imgName = "muyflaco.png";
  }
  else if(imc < 25) {
    message = "Normal";
    imgName = "bicho.jpg";
  }
  else if(imc < 27) {
    message = "Obesidad";
    imgName = "gordito.jpg";
  }
  else if(imc < 30) {
    message = "Obesidad grado I";
    imgName = "gordo.jpg";
  }
  else if(imc < 40) {
    message = "Obesidad grado II";
    imgName = "markhenry.png";
  }
  else {
    message = "Obesidad grado III";
    imgName = "megagordo.jpg";
  }
  elements.add(Text(message, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 22)));
  elements.add(Image.asset('assets/' + imgName, height: 500));

  return elements;
}