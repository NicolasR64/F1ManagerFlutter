import 'package:f1_project_manager/repositories/circuit_repo.dart';
import 'package:f1_project_manager/repositories/ecurie_repo.dart';
import 'package:f1_project_manager/repositories/pilote_repo.dart';
import 'package:f1_project_manager/screens/HomeScreen.dart';
import 'package:f1_project_manager/screens/models/Circuit.dart';
import 'package:f1_project_manager/screens/models/Ecurie.dart';
import 'package:f1_project_manager/screens/models/Pilote.dart';
import 'package:f1_project_manager/screens/services/AddEcurie/add_ecurie_bloc.dart';
import 'package:f1_project_manager/screens/services/AddPilote/add_pilote_bloc.dart';
import 'package:f1_project_manager/screens/services/ListCircuit/list_circuit_bloc.dart';
import 'package:f1_project_manager/screens/services/ListEcurie/list_ecurie_bloc.dart';
import 'package:f1_project_manager/screens/services/ListPilote/list_pilote_bloc.dart';
import 'package:f1_project_manager/screens/services/RemoveCircuit/remove_circuit_bloc.dart';
import 'package:f1_project_manager/screens/services/RemoveEcurie/remove_ecurie_bloc.dart';
import 'package:f1_project_manager/screens/services/RemovePilote/remove_pilote_bloc.dart';
import 'package:f1_project_manager/screens/services/addCircuit/add_circuit_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

final List<Circuit> listCircuits = [];
final List<Ecurie> listEcuries = [];
final List<Pilote> listPilotes = [];

Future<void> main() async{
  WidgetsFlutterBinding.ensureInitialized();

  final Database database = await openDatabase(
    join(await getDatabasesPath(), 'F1manager.db'),

    onCreate: (db, version) {
      db.execute('CREATE TABLE ecuries(id INTEGER PRIMARY KEY,nom TEXT)');
      db.execute('CREATE TABLE circuits(id INTEGER PRIMARY KEY,nom TEXT,pays TEXT)');
      db.execute('CREATE TABLE pilotes(id INTEGER PRIMARY KEY,nom TEXT, prenom TEXT, numero TEXT, ecurie TEXT, points int)');
    },
    version: 1,
  );

  final CircuitRepository circuitRepository = CircuitRepository(listCircuits: listCircuits, database: database);

  final EcurieRepository ecurieRepository = EcurieRepository(listEcuries: listEcuries, database: database);

  final PiloteRepository piloteRepository = PiloteRepository(listPilotes: listPilotes, database: database);

  await circuitRepository.initialize();

  await ecurieRepository.initialize();

  await piloteRepository.initialize();

  runApp(MyApp(circuitRepository: circuitRepository, ecurieRepository: ecurieRepository, piloteRepository: piloteRepository,));
}


class MyApp extends StatelessWidget {
  final CircuitRepository circuitRepository;
  final EcurieRepository ecurieRepository;
  final PiloteRepository piloteRepository;

  MyApp({super.key, required this.circuitRepository, required this.ecurieRepository, required this.piloteRepository,});

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
          ),
          BlocProvider<ListPiloteBloc>(
            lazy: false,
            create: (context) => ListPiloteBloc(piloteRepository),
          ),
          BlocProvider<AddPiloteBloc>(
            create: (context) => AddPiloteBloc(piloteRepository),
          ),
          BlocProvider<RemovePiloteBloc>(
            create: (context) => RemovePiloteBloc(piloteRepository),
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