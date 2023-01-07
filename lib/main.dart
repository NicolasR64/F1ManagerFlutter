import 'package:f1_project_manager/repositories/circuit_repo.dart';
import 'package:f1_project_manager/screens/HomeScreen.dart';
import 'package:f1_project_manager/screens/models/Circuit.dart';
import 'package:f1_project_manager/screens/services/ListCircuit/list_circuit_bloc.dart';
import 'package:f1_project_manager/screens/services/RemoveCircuit/remove_circuit_bloc.dart';
import 'package:f1_project_manager/screens/services/addCircuit/add_circuit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final Database database = await openDatabase(
    join(await getDatabasesPath(), 'f1manager.db'),

    onCreate: (db, version) {
      return db.execute(
          'CREATE TABLE ecuries(id INTEGER PRIMARY KEY,nom TEXT); CREATE TABLE circuits(id INTEGER PRIMARY KEY,nom TEXT,pays TEXT)',
      );
    },
    version: 1,
  );

  final CircuitRepository circuitRepository = CircuitRepository(listCircuits: listCircuits, database: database);

  await circuitRepository.initialize();

  runApp(MyApp(circuitRepository: circuitRepository,));
}

final List<Circuit> listCircuits = [];

class MyApp extends StatelessWidget {
  final CircuitRepository circuitRepository;

  MyApp({super.key, required this.circuitRepository,});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
        providers: [
          BlocProvider<ListCircuitBloc>(
              lazy: false,
              create: (context) => ListCircuitBloc(circuitRepository),
          ),
          BlocProvider(
              create: (context) => AddCircuitBloc(circuitRepository),
          ),
          BlocProvider(
            create: (context) => RemoveCircuitBloc(circuitRepository),
          )
        ],
        child: GetMaterialApp(
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