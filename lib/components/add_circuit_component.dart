import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCircuitComponent extends StatelessWidget {
  AddCircuitComponent({Key? key}) : super(key: key);

  final TextEditingController _controller = TextEditingController();

  @override
  void dispose(){
    _controller.dispose();
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
                        controller: _controller,
                        decoration: const InputDecoration(
                            hintText: "Nom du circuit"
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
                              // TO DO check data
                              if(_controller.text.isNotEmpty){
                                // TO DO
                                // Delete print
                                print(_controller.text);
                                Navigator.pop(context);
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