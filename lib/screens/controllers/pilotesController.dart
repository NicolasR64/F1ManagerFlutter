import 'dart:async';

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
  Future<void> insertPilote(Pilote pilote) async {
    // Get a reference to the database.
    final db = await database;

    // Insert the Pilote into the correct table. You might also specify the
    // `conflictAlgorithm` to use in case the same pilote is inserted twice.
    //
    // In this case, replace any previous data.
    await db.insert(
      'pilotes',
      pilote.toMap(),
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  }

  // A method that retrieves all the circuits from the pilotes table.
  Future<List<Pilote>> pilotes() async {
    // Get a reference to the database.
    final db = await database;

    // Query the table for all The Pilotes.
    final List<Map<String, dynamic>> maps = await db.query('pilotes');

    // Convert the List<Map<String, dynamic> into a List<Pilote>.
    return List.generate(maps.length, (i) {
      return Pilote(
        id: maps[i]['id'],
        nom: maps[i]['nom'],
        prenom: maps[i]['prenom'],
        numero: maps[i]['numero'],
        ecurie: maps[i]['ecurie'],
        points: maps[i]['points'],
      );
    });
  }

  Future<void> updatePilote(Pilote pilote) async {
    // Get a reference to the database.
    final db = await database;

    // Update the given Pilote.
    await db.update(
      'pilotes',
      pilote.toMap(),
      // Ensure that the Pilote has a matching id.
      where: 'id = ?',
      // Pass the Pilote's id as a whereArg to prevent SQL injection.
      whereArgs: [pilote.id],
    );
  }

  Future<void> deletePilote(int id) async {
    // Get a reference to the database.
    final db = await database;

    // Remove the Pilote from the database.
    await db.delete(
      'pilotes',
      // Use a `where` clause to delete a specific circuit.
      where: 'id = ?',
      // Pass the Pilote's id as a whereArg to prevent SQL injection.
      whereArgs: [id],
    );
  }
}