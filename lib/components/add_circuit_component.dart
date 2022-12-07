import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AddCircuitComponent extends StatelessWidget {
  const AddCircuitComponent({Key? key}) : super(key: key);
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
                const Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: TextField(
                        decoration: InputDecoration(
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
                            onPressed: () {},
                            child: Text('Annuler'.toUpperCase())
                        ),
                        TextButton(
                            onPressed: () {},
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