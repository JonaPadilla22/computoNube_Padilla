import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 09 - Pokedex'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView(
        children: generateListTiles()
      ),
    );
  }

}

generateListTiles() {
  final List<Map<String, dynamic>> jsonData = [
    {
      "title": "Normal",
    },
    {
      "title": "Fighting",
    },
    {
      "title": "Flying",
    },
    {
      "title": "Poison",
    },
    {
      "title": "Ground",
    },
    {
      "title": "Rock",
    },
    {
      "title": "Bug",
    },
    {
      "title": "Ghost",
    },
    {
      "title": "Steel",
    },
    {
      "title": "Fire",
    },
    {
      "title": "Water",
    },
    {
      "title": "Grass",
    },
    {
      "title": "Electric",
    },
    {
      "title": "Psychic",
    },
    {
      "title": "Ice",
    },
    {
      "title": "Dragon",
    },
    {
      "title": "Dark",
    },
    {
      "title": "Fairy",
    },
    {
      "title": "Unknown",
    },
    {
      "title": "Shadow",
    },
  ];
  List<Widget> listTiles = [];

  for (var data in jsonData) {
    listTiles.add(
      ListTile(
        contentPadding: EdgeInsets.only(top: 5, left: 10, right: 10, bottom: 0.0),
        title: Text(data["title"]),
        leading: CircleAvatar(
          radius: 22.0,
          backgroundImage: NetworkImage("https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Pokebola-pokeball-png-0.png/601px-Pokebola-pokeball-png-0.png"),
        ),
        trailing: Icon(Icons.arrow_right),
        onTap: () {
          // Acción a realizar cuando se toca el ListTile
        },
      ),
    );
  }
  return listTiles;
}
