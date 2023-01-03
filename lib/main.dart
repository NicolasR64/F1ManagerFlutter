import 'package:f1_project_manager/repositories/circuit_repo.dart';
import 'package:f1_project_manager/screens/HomeScreen.dart';
import 'package:f1_project_manager/screens/models/Circuit.dart';
import 'package:f1_project_manager/screens/services/ListCircuit/list_circuit_bloc.dart';
import 'package:f1_project_manager/screens/services/addCircuit/add_circuit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

circuitRepository circuitRepo = circuitRepository();
List<Circuit> listCircuit = circuitRepo.getAllCircuits();


void main() {
  print(listCircuit);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ListCircuitBloc>(
              lazy: false,
              create: (context) => ListCircuitBloc(
                  listCircuit
              )..add(OnInitializeListCircuitEvent()),
          ),
          BlocProvider(
              create: (context) => AddCircuitBloc(),
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