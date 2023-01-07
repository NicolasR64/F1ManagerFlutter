import 'package:f1_project_manager/screens/models/Circuit.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../models/Ecurie.dart';



class RickAstleyView extends StatefulWidget {
  RickAstleyView({Key? key}) : super(key: key);

  @override
  State<RickAstleyView> createState() => _rickAstleyViewState();
}

class _rickAstleyViewState extends State<RickAstleyView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pourquoi tu as appuyé?!'),
      ),
      body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Padding(
              padding: EdgeInsets.all(16.0),

              child: Image(image: AssetImage('assets/rickroll-roll.gif')),
            ),
            TextButton(
              onPressed: () {
                Get.back();
              },
              child:  const Text("Revenir à la page championnat"),
            ),

          ]
      ),
    );
  }
}