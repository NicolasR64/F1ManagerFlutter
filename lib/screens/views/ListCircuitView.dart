import 'package:f1_project_manager/repositories/circuit_repo.dart';
import 'package:f1_project_manager/screens/models/Circuit.dart';
import 'package:f1_project_manager/screens/services/ListCircuit/list_circuit_bloc.dart';
import 'package:f1_project_manager/screens/services/RemoveCircuit/remove_circuit_bloc.dart';
import 'package:f1_project_manager/screens/views/CircuitDetailsView.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';


class ListCircuitView extends StatelessWidget{
  ListCircuitView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return BlocListener<RemoveCircuitBloc, RemoveCircuitState>(
        listener: (context, state) {
          if (state is RemoveCircuitSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('circuit supprimer')));
          }
        },
        child: BlocBuilder<ListCircuitBloc, ListCircuitState>(builder: (context, state) {
            List<Circuit> listCircuit = [];
            if(state is ListCircuitUpdatedState){
              listCircuit = state.listCircuit;
            }
            return listCircuit.isEmpty
            ? const Center(child: Text('Pas de circuits'))
            : ListView.builder(
              itemCount: listCircuit.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key('${index.toString()}-${DateTime.now().microsecondsSinceEpoch}'),
                  onDismissed: (direction) {
                    print("Remove triggered");
                    context.read<RemoveCircuitBloc>().add(OnRemoveCircuitEvent(id: listCircuit[index].id));
                  },
                  background: Container(
                    color: Colors.red,
                  ),
                  child: GestureDetector(
                    onTap: () {
                      Get.to(
                        CircuitDetailsView(circuit: listCircuit[index],),
                        duration: const Duration(seconds: 1),
                      );
                    },
                    child: Card(
                      child :ListTile(
                        title: Text(listCircuit[index].nom),
                      ),
                    ),
                  ),
                );
              }
            );
        }),
    );
  }
}