import 'package:f1_project_manager/screens/services/addCircuit/add_circuit_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/services/AddEcurie/add_ecurie_bloc.dart';

class AddCircuitComponent extends StatelessWidget {
  AddCircuitComponent({Key? key}) : super(key: key);

  final TextEditingController _controllerNom = TextEditingController();

  @override
  void dispose(){
    _controllerNom.dispose();
  }

  void _modal(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (context) => BlocListener<AddCircuitBloc, AddCircuitState>(
          listener: (context, state) {
            if(state is AddCircuitSuccessState){
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Ecurie ajouté avec succès!')));
            }
            // TO DO
            // Reload list
          },
          child: Wrap(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Création d'écurie",
                      style: Theme.of(context).textTheme.headline6,
                    )
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: _controllerNom,
                        decoration: const InputDecoration(
                            hintText: "Nom :"
                        )
                    )
                ),
                Padding(
                    padding: const EdgeInsets.only(
                      bottom: 20.0,
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text('Annuler'.toUpperCase())
                        ),
                        TextButton(
                            onPressed: () {
                              if(_controllerNom.text.isNotEmpty){
                                context.read<AddEcurieBloc>().add(OnAddEcurieEvent(ecurieNom: _controllerNom.text));
                                _controllerNom.clear();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Les valeurs ne peuvent pas être vides!")
                                  ),
                                );
                                Navigator.pop(context);
                              }
                            },
                            child: Text('Ajouter'.toUpperCase())
                        )
                      ],
                    )
                )

              ])
      )
  );

  @override
  Widget build(BuildContext context) {
    return  FloatingActionButton(
      onPressed: () => _modal(context),
      child: const Icon(Icons.add),
    );
  }
}