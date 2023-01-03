import 'dart:async';

import 'package:f1_project_manager/screens/models/Ecurie.dart';
import 'package:f1_project_manager/screens/models/Pilote.dart';
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
  Future<void> insertEcurie(Ecurie ecurie) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Ecurie into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same ecurie is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'ecurie',
      ecurie.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the circuits from the ecuries table.
  Future<List<Ecurie>> ecuries() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Ecuries.
    final List<Map<String, dynamic>> maps = await db.query('ecurie');

    // Convert the List<Map<String, dynamic> into a List<Ecurie>.
    return List.generate(maps.length, (i) {
      return Ecurie(
        id: maps[i]['id'],
        nom: maps[i]['nom'],
      );
    });
  }

  Future<void> updateEcurie(Ecurie ecurie) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Ecurie.
    await db.update(
      'ecurie',
      ecurie.toMap(),
      // Ensure that the Ecurie has a matching id.
      where: 'id = ?',
      // Pass the Ecurie's id as a whereArg to prevent SQL injection.
      whereArgs: [ecurie.id],
    );
  }

  Future<void> deleteEcurie(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Ecurie from the database.
    await db.delete(
      'ecurie',
      // Use a `where` clause to delete a specific circuit.
      where: 'id = ?',
      // Pass the Ecurie's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}