import 'package:flutter/material.dart';

class ListPage extends StatelessWidget {

  final List<String> _clasesPokemon = [
    "Normal",
    "Fighting",
    "Flying",
    "Poison",
    "Ground",
    "Rock",
    "Bug",
    "Ghost",
    "Steel",
    "Fire",
    "Water",
    "Grass",
    "Electric",
    "Psychic",
    "Ice",
    "Dragon",
    "Dark",
    "Fairy",
    "Unknown",
    "Shadow"
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 10 - Pokedex'),
        centerTitle: true,
        backgroundColor: Colors.red,
      ),
      body: ListView.builder(
        itemCount: _clasesPokemon.length,
        itemBuilder: (BuildContext context, int index) {
          return ListTile(
            onTap: () {},
            title: Text('${_clasesPokemon[index]}'),
            leading: CircleAvatar(
              backgroundImage: NetworkImage(
                "https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Pokebola-pokeball-png-0.png/601px-Pokebola-pokeball-png-0.png"
              ),
              radius: 16.0,
            ),
            trailing: Icon(Icons.arrow_right),
          );
        })
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
