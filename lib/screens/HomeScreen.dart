import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Center(
        child: Text('home'),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.emoji_events),
            label: 'Championnat',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.add_road),
            label: 'Circuits',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.directions_car),
            label: 'Pilotes',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.local_gas_station),
            label: 'Ecuries',
          ),
        ],
      ),
    );
  }
}