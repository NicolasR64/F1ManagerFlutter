import 'package:f1_project_manager/repositories/circuit_repo.dart';
import 'package:f1_project_manager/screens/models/Circuit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

circuitRepository circuitRepo = new circuitRepository();

class ListCircuitView extends StatelessWidget{
  ListCircuitView({Key? key}) : super(key: key);
  List<Circuit> listCircuit = circuitRepo.getAllCircuits();
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listCircuit.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(index.toString()),
            onDismissed: (direction) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$index dismissed'),
                  ),
              );
            },
            background: Container(
              color: Colors.red,
            ),
            child:Card(
              child :ListTile(
                title: Text(listCircuit[index].nom),
              ),
            ),
          );
        }
    );
  }
}