import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

class CrudPage extends StatefulWidget {
  @override
  State<CrudPage> createState() => _CrudPageState();
}

class _CrudPageState extends State<CrudPage> {
  late String _path;
  late Database database;

  @override
  void initState() {
    _createDB();
    super.initState();    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Practica 14 - SQLite'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                _insertDB();
              }, 
              child: Text('INSERT'),
              style: ElevatedButton.styleFrom(
                primary: Colors.green, onPrimary: Colors.white
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _removeDB();
              }, 
              child: Text('REMOVE'),
              style: ElevatedButton.styleFrom(
                primary: Colors.red, onPrimary: Colors.white
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _updateDB();
              }, 
              child: Text('UPDATE'),
              style: ElevatedButton.styleFrom(
                primary: Colors.blue, onPrimary: Colors.white
              ),
            ),
            ElevatedButton(
              onPressed: () {
                _showDB();
              }, 
              child: Text('SHOW'),
              style: ElevatedButton.styleFrom(
                primary: Colors.amber, onPrimary: Colors.white
              ),
            )
          ],
        )
      ),
    );
  }

  void _createDB() async {
    var dbpath = await getDatabasesPath();
    _path = '${dbpath}/mydb.db';

    database = await openDatabase(_path, version: 1,
      onCreate: (Database db, int version) async {
        await db.execute(
          'CREATE TABLE Test (id INTEGER PRIMARY KEY, name TEXT, nickname TEXT)'
        );
      }
    );
  }

  void _insertDB() async {
    await database.transaction((txn) async {
      int reg1 = await txn.rawInsert(
        'INSERT INTO Test(name, nickname) VALUES ("Din Djarin", "The Mandalorian")'
      );
      print('Insert $reg1');
      int reg2 = await txn.rawInsert(
        'INSERT INTO Test(name, nickname) VALUES (?, ?)', ['Grogu', 'The Child']
      );
      print('Insert $reg2');
    });
  }
  
  void _removeDB() async {
    int rem = await database.rawDelete('DELETE FROM Test WHERE name = ?', ['Grogu']);
    print('Remove: $rem');
  }

  void _updateDB() async {
    int upt = await database.rawUpdate(
      'UPDATE Test SET nickname =? WHERE name = ?', ['Mando', 'Din Djarin']
    );
    print('Update: $upt');
  }

  void _showDB() async {
    List<Map> show = await database.rawQuery('SELECT * FROM Test');
    print(show);
  }
}