import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

const List<Map<String, dynamic>> listMapping = [
  {
    'name': "#first",
  },
  {
    'name': "#second",
  },
];

class ListCircuitView extends StatelessWidget{
  const ListCircuitView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: listMapping.length,
        itemBuilder: (context, index) {
          return Dismissible(
            key: Key(index.toString()),
            onDismissed: (direction) {
              ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content: Text('$index dismissed'),
                  ),
              );
            },
            background: Container(
              color: Colors.red,
            ),
            child:Card(
              child :ListTile(
                title: Text(listMapping[index]['name']),
              ),
            ),
          );
        }
    );
  }
}