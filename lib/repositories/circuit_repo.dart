import 'dart:async';

import 'package:f1_project_manager/main.dart';
import 'package:f1_project_manager/screens/models/Circuit.dart';

class CircuitRepository{
  final List<Circuit> listCircuits;

  CircuitRepository({required this.listCircuits}){
    List<Circuit> circuits = listCircuits.map((e) => Circuit(id: e.id, nom: e.nom, pays: e.pays)).toList();
    _circuitController.add(circuits);
  }

  StreamController<List<Circuit>> _circuitController = StreamController<List<Circuit>>();

  Stream<List<Circuit>> get circuits => _circuitController.stream;

  Future<void> addNewCircuit(Circuit circuit) async {
    listCircuits.add(circuit);
    List<Circuit> circuits = listCircuits.map((e) => Circuit(id: e.id, nom: e.nom, pays: e.pays)).toList();
    _circuitController.add(circuits);
  }

  Future<void> removeCircuit(int id) async {
    listCircuits.removeWhere((e) => e.id == id);
    List<Circuit> circuits = listCircuits.map((e) => Circuit(id: e.id, nom: e.nom, pays: e.pays)).toList();
    _circuitController.add(circuits);
  }
}