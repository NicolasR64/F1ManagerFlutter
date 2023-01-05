import 'dart:async';

import 'package:f1_project_manager/main.dart';
import 'package:f1_project_manager/screens/models/Circuit.dart';
import 'package:sqflite/sqflite.dart';

class CircuitRepository{
  final Database database;

  List<Circuit> listCircuits = [];

  CircuitRepository({required this.listCircuits, required this.database}){
    // retrieve
    List<Circuit> circuits = listCircuits.map((e) => Circuit(id: e.id, nom: e.nom, pays: e.pays)).toList();
    _circuitController.add(circuits);
  }

  final StreamController<List<Circuit>> _circuitController = StreamController<List<Circuit>>();

  Stream<List<Circuit>> get circuits => _circuitController.stream;

  Future<void> initialize() async {

    final List<Map<String, dynamic>> listDb = await database.query("circuits");

    listCircuits = listDb.map((e) => Circuit(id: e["id"], nom: e["nom"], pays: e["pays"])).toList();
    _circuitController.add(listCircuits);
  }

  Future<void> addNewCircuit(Circuit circuit) async {
    // add
    circuit.id = listCircuits.length + 1 ;
    database.insert("circuits", circuit.toMap(), conflictAlgorithm: ConflictAlgorithm.replace,);

    print("addNewCircuit triggered");
    listCircuits.add(circuit);

    List<Circuit> circuits = listCircuits.map((e) => Circuit(id: e.id, nom: e.nom, pays: e.pays)).toList();
    _circuitController.add(circuits);
  }

  Future<void> removeCircuit(int id) async {
    // remove
    await database.delete("circuits", where: 'id = ?', whereArgs: [id]);

    print("removeCircuit triggered");
    listCircuits.removeWhere((e) => e.id == id);
    List<Circuit> circuits = listCircuits.map((e) => Circuit(id: e.id, nom: e.nom, pays: e.pays)).toList();
    _circuitController.add(circuits);
  }
}