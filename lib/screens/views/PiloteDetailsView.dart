import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/Pilote.dart';

class PiloteDetailsView extends StatefulWidget {
  Pilote pilote;
  PiloteDetailsView({Key? key, required this.pilote}) : super(key: key);

  @override
  State<PiloteDetailsView> createState() => _piloteDetailsViewState();
}

class _piloteDetailsViewState extends State<PiloteDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pilote: ${widget.pilote.nom}'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child:
              Text(
                'Nom de du pilote : ${widget.pilote.nom}',
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
                'Prénom de du pilote : ${widget.pilote.prenom}',
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
                'Numéro de du pilote : ${widget.pilote.numero}',
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
                'Ecurie de du pilote : ${widget.pilote.ecurie}',
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
                'Points de du pilote : ${widget.pilote.points}',
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
              child:  const Text("Revenir à la liste des pilotes"),
            ),
          ]
      ),
    );
  }
}