import 'dart:async';

import 'package:f1_project_manager/main.dart';
import 'package:f1_project_manager/screens/models/Pilote.dart';
import 'package:sqflite/sqflite.dart';

class PiloteRepository{
  final Database database;

  List<Pilote> listPilotes = [];

  PiloteRepository({required this.listPilotes, required this.database}){
    // retrieve
    List<Pilote> pilotes = listPilotes.map((e) => Pilote(id: e.id, nom: e.nom, prenom: e.prenom, numero: e.numero, ecurie: e.ecurie, points: e.points)).toList();
    _piloteController.add(pilotes);
  }

  final StreamController<List<Pilote>> _piloteController = StreamController<List<Pilote>>();

  Stream<List<Pilote>> get pilotes => _piloteController.stream;

  Future<void> initialize() async {

    final List<Map<String, dynamic>> listDb = await database.query("pilotes");

    listPilotes = listDb.map((e) => Pilote(id: e["id"], nom: e["nom"], prenom: e["prenom"], numero: e["numero"], ecurie: e["ecurie"], points: e["points"])).toList();
    _piloteController.add(listPilotes);
  }

  Future<void> addNewPilote(Pilote newPilote) async {
    // add
    newPilote.id = listPilotes.length + 1 ;
    database.insert("pilotes", newPilote.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);

    print("addNewPilote triggered");
    listPilotes.add(newPilote);

    List<Pilote> pilote = listPilotes.map((e) => Pilote(id: e.id, nom: e.nom, prenom: e.prenom, numero: e.numero, ecurie: e.ecurie ,points: e.points)).toList();
    _piloteController.add(pilote);
  }

  Future<void> removePilote(int id) async {
    // remove
    await database.delete("pilotes", where: 'id = ?', whereArgs: [id]);

    print("removePilote triggered");
    listPilotes.removeWhere((e) => e.id == id);
    List<Pilote> pilotes = listPilotes.map((e) => Pilote(id: e.id, nom: e.nom, prenom: e.prenom, numero: e.numero, ecurie: e.ecurie, points: e.points)).toList();
    _piloteController.add(pilotes);
  }
}