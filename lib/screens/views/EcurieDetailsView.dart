import 'package:f1_project_manager/screens/models/Circuit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/Ecurie.dart';



class EcurieDetailsView extends StatefulWidget {
  Ecurie ecurie;
  EcurieDetailsView({Key? key, required this.ecurie}) : super(key: key);

  @override
  State<EcurieDetailsView> createState() => _ecurieDetailsViewState();
}

class _ecurieDetailsViewState extends State<EcurieDetailsView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Ecurie: ${widget.ecurie.nom}'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),
              child:
              Text(
                'Nom de l\'Ecurie : ${widget.ecurie.nom}',
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
              child:  const Text("Revenir à la liste des ecuries"),
            ),
          ]
      ),
    );
  }
}