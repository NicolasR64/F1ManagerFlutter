import 'package:f1_project_manager/screens/services/addCircuit/add_circuit_bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddCircuitComponent extends StatelessWidget {
  AddCircuitComponent({Key? key}) : super(key: key);

  final TextEditingController _controllerNom = TextEditingController();
  final TextEditingController _controllerPays = TextEditingController();

  @override
  void dispose(){
    _controllerNom.dispose();
    _controllerPays.dispose();
  }

  void _modal(BuildContext context) => showModalBottomSheet(
      context: context,
      builder: (context) => Padding(
          padding: const EdgeInsets.all(8.0),
          child: Wrap(
              children: <Widget>[
                Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      "Création de circuits",
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
                        controller: _controllerPays,
                        decoration: const InputDecoration(
                            hintText: "Pay :"
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
                              Navigator.pop(context);
                              if(_controllerNom.text.isNotEmpty && _controllerPays.text.isNotEmpty){
                                context.read<AddCircuitBloc>().add(OnAddCircuitEvent(circuitNom: _controllerNom.text,circuitPays: _controllerPays.text ));
                                _controllerNom.clear();
                                _controllerPays.clear();
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text("Les valeurs ne peuvent pas être vides!")
                                  ),
                                );
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