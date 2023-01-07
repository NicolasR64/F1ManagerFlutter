import 'package:flutter/material.dart';
import 'package:f1_project_manager/screens/views/ListCircuitView.dart';
import 'package:f1_project_manager/screens/views/ListPilotesView.dart';
import 'package:f1_project_manager/screens/views/ListEcuriesView.dart';
import 'package:f1_project_manager/screens/views/championnatView.dart';

import '../components/add_circuit_component.dart';
import '../components/add_ecurie_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);
  @override
  State<StatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen>{
  PageController _pageController = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  void dispose(){
    _pageController.dispose();
    super.dispose();
  }
  addFloatingActionButton(){
    switch(_currentIndex) {
      case 0:{
        return null;
      }
      break;
      case 1:{
        return AddCircuitComponent();
      }
      break;
      case 2:{
        return AddEcurieComponent();
      }
      break;
      case 3:{
        return null;
      }
      break;
    }
    return AddCircuitComponent();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: PageView(
        onPageChanged: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        controller: _pageController,
        children: <Widget>[
          championnatView(),
          ListCircuitView(),
          ListPilotesView(),
          ListEcuriesView(),
        ],
      ),
      floatingActionButton: addFloatingActionButton(),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (int index)
        {
          setState(() {
            _currentIndex = index;
          });

          _pageController.jumpToPage(index);
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.blue,
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