import 'dart:async';

import 'package:redacteur/models/redacteur.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as p;
class DatabaseManager {
  static final DatabaseManager _mydata = DatabaseManager._internal();
  factory DatabaseManager() => _mydata;
  late Database database;
  DatabaseManager._internal();

  Future<void> dbInit() async{
    String pathDB = p.join(await getDatabasesPath(), 'redacteur.db');
    print('initDatabase');
    database = await openDatabase(pathDB ,onCreate: _onCreate, version: 1,);
  }

  Future<void> _onCreate(Database db, int version) async{
    await db.execute(
      '''
          CREATE TABLE redacteur(
          redacteurId INTEGER PRIMARY KEY AUTOINCREMENT,
          nom TEXT,
          prenom TEXT,
          email TEXT
          )
      '''
    );
    // ignore: avoid_print
    print('La base de donnees a ete cree avec succes !');
  }


  
  // ignore: unused_element
  Future<List<Redacteur>> getRedacteurs() async{
    final List<Map<String, dynamic>> redacteurs = await database.query(
      'redacteur'
    );
    List<Redacteur> listes = [];
    for (var redact in redacteurs) {
      listes.add(Redacteur.fromMap(redact));
    }
    return listes;
  }


  // ignore: unused_element
  Future<void> insertRedacteur(Redacteur redacteur) async {
    var data = redacteur.toMap();
    await database.insert(
      'redacteur',
       data     
);
  }

  // ignore: unused_element
  Future<void> updateRedacteur(Redacteur redacteur) async {
    var data = redacteur.toMap();
    await database.update('redacteur', data, where: 'redacteurId = ?', whereArgs: [redacteur.redacteurId]);
  }


  // ignore: unused_element
  Future<void> deleteRedacteur(int id) async{
    database.delete('redacteur', where: 'redacteurId = ?', whereArgs: [id]);
  }
}