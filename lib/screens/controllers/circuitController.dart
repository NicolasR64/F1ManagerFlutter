import 'dart:async';

import 'package:f1_project_manager/screens/models/Circuit.dart';
import 'package:flutter/widgets.dart';
import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final database = openDatabase(
    join(await getDatabasesPath(), 'f1Manager.db'),
    version: 1,
  );

  // Define a function that inserts pilotes into the database
  Future<void> insertCircuit(Circuit circuit) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Circuit into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same circuit is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'circuit',
      circuit.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the circuits from the dogs table.
  Future<List<Circuit>> circuits() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Circuits.
    final List<Map<String, dynamic>> maps = await db.query('circuit');

    // Convert the List<Map<String, dynamic> into a List<Circuit>.
    return List.generate(maps.length, (i) {
      return Circuit(
        id: maps[i]['id'],
        nom: maps[i]['nom'],
        pays: maps[i]['pays'],
      );
    });
  }

  Future<void> updateCircuit(Circuit circuit) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Circuit.
    await db.update(
      'circuit',
      circuit.toMap(),
      // Ensure that the Circuit has a matching id.
      where: 'id = ?',
      // Pass the Circuit's id as a whereArg to prevent SQL injection.
      whereArgs: [circuit.id],
    );
  }

  Future<void> deleteCircuit(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Circuit from the database.
    await db.delete(
      'circuit',
      // Use a `where` clause to delete a specific circuit.
      where: 'id = ?',
      // Pass the Circuit's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}