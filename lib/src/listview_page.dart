import 'package:flutter/material.dart';
import 'package:computonube_padilla/data/movies.dart';
import 'package:flutter_slidable/flutter_slidable.dart';

class ListViewPage extends StatefulWidget {
  const ListViewPage({super.key});

  @override
  State<ListViewPage> createState() => _ListViewPageState();
}

class _ListViewPageState extends State<ListViewPage> {
  List<Map<String, dynamic>> pelis = [...movies];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Practica 17 - Dismissed"),
        backgroundColor: Colors.orangeAccent,
      ),
      body: ListView.builder(
        itemCount: pelis.length,
        itemBuilder: (BuildContext context, int index){
          final item = pelis[index];
          return Slidable(
            key: const ValueKey(0),
            child: ListTile(
              title: Text(item['title_name']),
              subtitle: Text(item['Genres'])
            ),
            startActionPane: ActionPane(
              motion: const ScrollMotion(),
              dismissible: DismissiblePane(onDismissed: () {}),
              children: [
                SlidableAction(
                  onPressed: (BuildContext context) {
                    onDismissed(index, 'Agregar');
                  },
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white,
                  icon: Icons.library_add,
                  label: 'Agregar',
                )
              ],
            ),
            endActionPane: ActionPane(
              motion: ScrollMotion(),
              children: [
                SlidableAction(
                  flex: 2,
                  onPressed: (BuildContext context) {
                    onDismissed(index, 'Eliminar');
                  },
                  backgroundColor: Colors.red,
                  foregroundColor: Colors.white,
                  icon: Icons.archive,
                  label: 'Eliminar',
                )
              ],
            ),
          );
        }
      ),
    );
  }

  onDismissed(int index, String accion){
    setState(() {
      final _snackBar = SnackBar(content: Text('Accion: $accion'));
      pelis.removeAt(index);
      switch (accion) {
        case 'Agregar':
          ScaffoldMessenger.of(context).showSnackBar(_snackBar);
          break;
        case 'Eliminar':
          ScaffoldMessenger.of(context).showSnackBar(_snackBar);
          break;
      }
    });
  }
}