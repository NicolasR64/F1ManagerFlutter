import 'package:f1_project_manager/repositories/circuit_repo.dart';
import 'package:f1_project_manager/screens/HomeScreen.dart';
import 'package:f1_project_manager/screens/models/Circuit.dart';
import 'package:f1_project_manager/screens/services/ListCircuit/list_circuit_bloc.dart';
import 'package:f1_project_manager/screens/services/addCircuit/add_circuit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

Circuit circuit01 = new Circuit(id: 01, nom: 'monacco', pays: 'france');
Circuit circuit02 = new Circuit(id: 02, nom: 'spa', pays: 'belgique');
final List<Circuit> listCircuits = [circuit01, circuit02];

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final CircuitRepository circuitRepository = CircuitRepository(listCircuits: listCircuits);

    return MultiBlocProvider(
        providers: [
          BlocProvider<ListCircuitBloc>(
              lazy: false,
              create: (context) => ListCircuitBloc(circuitRepository),
          ),
          BlocProvider(
              create: (context) => AddCircuitBloc(circuitRepository),
          )
        ],
        child: MaterialApp(
          title: 'F1 Manager 2024',
          theme: ThemeData(
            primarySwatch: Colors.blue,
          ),
          debugShowCheckedModeBanner: false,
          home: const HomeScreen(),
        )
    );
  }
}