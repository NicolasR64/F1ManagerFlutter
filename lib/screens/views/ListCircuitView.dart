import 'package:f1_project_manager/repositories/circuit_repo.dart';
import 'package:f1_project_manager/screens/models/Circuit.dart';
import 'package:f1_project_manager/screens/services/ListCircuit/list_circuit_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class ListCircuitView extends StatelessWidget{
  ListCircuitView({Key? key}) : super(key: key);
  List<Circuit> listCircuit = [];
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ListCircuitBloc, ListCircuitState>(builder: (context, state) {

      print('state is : $state');
      if(state is ListCircuitUpdatedState){
        print(state);
        print(state.listCircuit);
        this.listCircuit = state.listCircuit;
        print(this.listCircuit);
      }
      return listCircuit.isEmpty
          ? const Center(child: Text('Pas de circuits'))
          : ListView.builder(
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
    });
  }
}