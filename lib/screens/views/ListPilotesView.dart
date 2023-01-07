import 'package:f1_project_manager/screens/services/RemovePilote/remove_pilote_bloc.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';import 'package:flutter_bloc/flutter_bloc.dart';

import '../models/Pilote.dart';
import '../services/ListPilote/list_pilote_bloc.dart';
import 'PiloteDetailsView.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class ListPilotesView extends StatelessWidget{
  const ListPilotesView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocListener<RemovePiloteBloc, RemovePiloteState>(
      listener: (context, state) {
        if (state is RemovePiloteSuccess) {
          ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(content: Text('pilote supprimer')));
        }
      },
      child: BlocBuilder<ListPiloteBloc, ListPiloteState>(builder: (context, state) {
        List<Pilote> listPilote = [];
        if(state is ListPiloteUpdatedState){
          listPilote = state.listPilote;
        }
        return listPilote.isEmpty
            ? const Center(child: Text('Pas de pilotes'))
            : ListView.builder(
            itemCount: listPilote.length,
            itemBuilder: (context, index) {
              return Dismissible(
                key: Key('${index.toString()}-${DateTime.now().microsecondsSinceEpoch}'),
                onDismissed: (direction) {
                  print("Remove triggered");
                  context.read<RemovePiloteBloc>().add(OnRemovePiloteEvent(id: listPilote[index].id));
                },
                background: Container(
                  color: Colors.red,
                ),
                child: GestureDetector(
                  onTap: () {
                    Get.to(
                      PiloteDetailsView(pilote: listPilote[index],),
                      duration: const Duration(seconds: 1),
                    );
                  },
                  child: Card(
                    child :ListTile(
                      title: Text(listPilote[index].nom),
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

