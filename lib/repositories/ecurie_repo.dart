import 'dart:async';

import 'package:f1_project_manager/main.dart';
import 'package:f1_project_manager/screens/models/Circuit.dart';
import 'package:sqflite/sqflite.dart';

import '../screens/models/Ecurie.dart';

class EcurieRepository{
  final Database database;

  List<Ecurie> listEcuries = [];

  EcurieRepository({required this.listEcuries, required this.database}){
    // retrieve
    List<Ecurie> ecuries = listEcuries.map((e) => Ecurie(id: e.id, nom: e.nom)).toList();
    _ecurieController.add(ecuries);
  }

  final StreamController<List<Ecurie>> _ecurieController = StreamController<List<Ecurie>>();

  Stream<List<Ecurie>> get ecuries => _ecurieController.stream;

  Future<void> initialize() async {

    final List<Map<String, dynamic>> listDb = await database.query("ecuries");

    listEcuries = listDb.map((e) => Ecurie(id: e["id"], nom: e["nom"])).toList();
    _ecurieController.add(listEcuries);
  }

  Future<void> addNewEcurie(Ecurie newEcurie) async {
    // add
    newEcurie.id = listEcuries.length + 1 ;
    database.insert("ecuries", newEcurie.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);

    print("addNewEcurie triggered");
    listEcuries.add(newEcurie);

    List<Ecurie> ecurie = listEcuries.map((e) => Ecurie(id: e.id, nom: e.nom)).toList();
    _ecurieController.add(ecurie);
  }

  Future<void> removeEcurie(int id) async {
    // remove
    await database.delete("ecuries", where: 'id = ?', whereArgs: [id]);

    print("removeEcurie triggered");
    listEcuries.removeWhere((e) => e.id == id);
    List<Ecurie> ecuries = listEcuries.map((e) => Ecurie(id: e.id, nom: e.nom)).toList();
    _ecurieController.add(ecuries);
  }
}