import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/Ecurie.dart';
import '../services/ListEcurie/list_ecurie_bloc.dart';
import '../services/RemoveEcurie/remove_ecurie_bloc.dart';
import 'EcurieDetailsView.dart';

class ListEcuriesView extends StatelessWidget{
  const ListEcuriesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RemoveEcurieBloc, RemoveEcurieState>(
      listener: (context, state) {
        if (state is RemoveEcurieSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('Ecurie supprimer')));
        }
      },
      child: BlocBuilder<ListEcurieBloc, ListEcurieState>(builder: (context, state) {
        List<Ecurie> listEcurie = [];
        if(state is ListEcurieUpdatedState){
          listEcurie = state.listEcurie;
        }
        return listEcurie.isEmpty
            ? const Center(child: Text('Pas de ecuries'))
            : ListView.builder(
            itemCount: listEcurie.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key('${index.toString()}-${DateTime.now().microsecondsSinceEpoch}'),
                onDismissed: (direction) {
                  print("Remove triggered");
                  context.read<RemoveEcurieBloc>().add(OnRemoveEcurieEvent(id: listEcurie[index].id));
                },
                background: Container(
                  color: Colors.red,
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      EcurieDetailsView(ecurie: listEcurie[index]),
                      duration: const Duration(seconds: 1),
                    );
                  },
                  child: Card(
                    child :ListTile(
                      title: Text(listEcurie[index].nom),
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