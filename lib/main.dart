import 'package:f1_project_manager/repositories/circuit_repo.dart';
import 'package:f1_project_manager/repositories/ecurie_repo.dart';
import 'package:f1_project_manager/screens/HomeScreen.dart';
import 'package:f1_project_manager/screens/models/Circuit.dart';
import 'package:f1_project_manager/screens/models/Ecurie.dart';
import 'package:f1_project_manager/screens/services/AddEcurie/add_ecurie_bloc.dart';
import 'package:f1_project_manager/screens/services/ListCircuit/list_circuit_bloc.dart';
import 'package:f1_project_manager/screens/services/ListEcurie/list_ecurie_bloc.dart';
import 'package:f1_project_manager/screens/services/RemoveCircuit/remove_circuit_bloc.dart';
import 'package:f1_project_manager/screens/services/RemoveEcurie/remove_ecurie_bloc.dart';
import 'package:f1_project_manager/screens/services/addCircuit/add_circuit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final List<Circuit> listCircuits = [];
final List<Ecurie> listEcuries = [];

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

  final EcurieRepository ecurieRepository = EcurieRepository(listEcuries: listEcuries, database: database);

  await circuitRepository.initialize();

  runApp(MyApp(circuitRepository: circuitRepository, ecurieRepository: ecurieRepository,));
}


class MyApp extends StatelessWidget {
  final CircuitRepository circuitRepository;
  final EcurieRepository ecurieRepository;

  MyApp({super.key, required this.circuitRepository, required this.ecurieRepository});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {


    return MultiBlocProvider(
        providers: [
          BlocProvider<ListCircuitBloc>(
              lazy: false,
              create: (context) => ListCircuitBloc(circuitRepository),
          ),
          BlocProvider<AddCircuitBloc>(
              create: (context) => AddCircuitBloc(circuitRepository),
          ),
          BlocProvider<RemoveCircuitBloc>(
            create: (context) => RemoveCircuitBloc(circuitRepository),
          ),
          BlocProvider<ListEcurieBloc>(
            lazy: false,
            create: (context) => ListEcurieBloc(ecurieRepository),
          ),
          BlocProvider<AddEcurieBloc>(
            create: (context) => AddEcurieBloc(ecurieRepository),
          ),
          BlocProvider<RemoveEcurieBloc>(
            create: (context) => RemoveEcurieBloc(ecurieRepository),
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