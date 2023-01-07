import 'package:f1_project_manager/screens/services/addCircuit/add_circuit_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../screens/services/AddEcurie/add_ecurie_bloc.dart';
import '../screens/services/AddPilote/add_pilote_bloc.dart';

class AddPiloteComponent extends StatelessWidget {
  AddPiloteComponent({Key? key}) : super(key: key);

  final TextEditingController _controllerNom = TextEditingController();
  final TextEditingController _controllerPrenom = TextEditingController();
  final TextEditingController _controllerNumero = TextEditingController();
  final TextEditingController _controllerEcurie = TextEditingController();
  final TextEditingController _controllerPoints = TextEditingController();

  @override
  void dispose(){
    _controllerNom.dispose();
  }

  void _modal(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (context) => BlocListener<AddPiloteBloc, AddPiloteState>(
          listener: (context, state) {
            if(state is AddPiloteSuccessState){
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text('Pilote ajouté avec succès!')));
            }
            // TO DO
            // Reload list
          },
          child: Wrap(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Création de pilotes",
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
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: _controllerPrenom,
                        decoration: const InputDecoration(
                            hintText: "Prenom :"
                        )
                    )
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: _controllerNumero,
                        decoration: const InputDecoration(
                            hintText: "Numero :"
                        )
                    )
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: _controllerEcurie,
                        decoration: const InputDecoration(
                            hintText: "Ecurie :"
                        )
                    )
                ),
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        controller: _controllerPoints,
                        decoration: const InputDecoration(
                            hintText: "Points :"
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
                                context.read<AddPiloteBloc>().add(OnAddPiloteEvent(piloteNom: _controllerNom.text, pilotePrenom: _controllerPrenom.text, piloteNumero: _controllerNumero.text, piloteEcurie: _controllerEcurie.text, pilotePoints: int.parse(_controllerPoints.text)));
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