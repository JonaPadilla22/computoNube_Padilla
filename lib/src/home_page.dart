import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:computonube_padilla/src/game_page.dart';

class HomePage extends StatefulWidget {
  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final data = Data(num_pairs: 8);

  @override
  void initState() {
    super.initState();    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Memorama'),
        centerTitle: true,
        backgroundColor: const Color(0xff0e2050),
        foregroundColor: Colors.white,
      ),
      body: Column(
        children: [
          Expanded(
            child: Center(
              child: CarouselSlider(
                options: CarouselOptions(
                  height: 250.0, 
                  onPageChanged: (int index, reason) {
                    int selectedPairs = [8, 10, 12][index];
                    data.num_pairs = selectedPairs;
                  },
                ),
                items: [8, 10, 12].map((i) {
                  return Builder(
                    builder: (BuildContext context) {
                      return Container(
                        width: MediaQuery.of(context).size.width,
                        margin: EdgeInsets.symmetric(horizontal: 5.0),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10.0),
                          gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            colors: [Color(0xff0e2050), Color(0xff113a97)],
                          ),
                        ),
                        child: Center(
                          child: Text('$i pares', style: const TextStyle(fontSize: 40.0, color: Colors.white)),
                        ),
                      );
                    },
                  );
                }).toList(),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(bottom: 20.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => GamePage(data: data),
                  ));
                });
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xff0e2050),
                foregroundColor: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 60.0, vertical: 20.0),
              ),
              child: Text('Iniciar Juego', style: TextStyle(fontSize: 25.0)),
            ),
          )
        ],
      )
    );
  }
}

class Data {
  int num_pairs;
  Data({required this.num_pairs});
}