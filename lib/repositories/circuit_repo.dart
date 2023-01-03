import 'package:f1_project_manager/screens/models/Circuit.dart';

class circuitRepository{
  static Circuit circuit01 = new Circuit(id: 01, nom: 'monacco', pays: 'france');
  static Circuit circuit02 = new Circuit(id: 02, nom: 'spa', pays: 'belgique');
  final  List<Circuit> Circuits = [circuit01, circuit02];

  List<Circuit> getAllCircuits(){
    return this.Circuits;
  }

  circuitRepository(){}
}