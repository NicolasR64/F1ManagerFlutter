import 'package:f1_project_manager/screens/models/Circuit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';



class CircuitDetailsView extends StatefulWidget {
  Circuit circuit;
  CircuitDetailsView({Key? key, required this.circuit}) : super(key: key);

  @override
  State<CircuitDetailsView> createState() => _circuitDetailsViewState();
}

class _circuitDetailsViewState extends State<CircuitDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Circuit: ${widget.circuit.nom}'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child:
              Text(
                'Nom du circuit : ${widget.circuit.nom}',
                style: const TextStyle(
                  fontSize: 15.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child:
              Text(
                'Pays : ${widget.circuit.pays}',
                style: const TextStyle(
                  fontSize: 15.0,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child:  const Text("Revenir à la liste"),
            ),

          ]
      ),
    );
  }
}