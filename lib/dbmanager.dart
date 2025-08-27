import 'dart:async';

import 'package:activite1/Modele/redacteur.dart';
import 'package:sqflite/sqflite.dart';

import 'package:path/path.dart';

class DatabaseManager {
  late Database _database;

  Future<void> initialisation() async {
    _database = await openDatabase(
      join(await getDatabasesPath(), 'users_database.db'),
      onCreate: (db, version) {
        return db.execute(
          '''CREATE TABLE users(
      id INTEGER PRIMARY KEY AUTOINCREMENT,
      fname TEXT,
      lname TEXT,
      email TEXT)''',
        );
      },
      version: 1,
    );
  }

  //get All Users

  Future<List<Redacteur>> getAllRedacteurs() async {
    final List<Map<String, dynamic>> maps = await _database.query('users');

    return List.generate(maps.length, (i) {
      return Redacteur(
        id: maps[i]['id'],
        fname: maps[i]['fname'],
        lname: maps[i]['lname'],
        email: maps[i]['email'],
      );
    });
  }

  //insert a new user in the database

  Future<void> insertRedacteur(Redacteur user) async {
    await _database.insert(
      'users',
      user.toMap(),
    );
  }

  //Update a user's information

  Future<void> updateRedacteur(Redacteur user) async {
    await _database
        .update('users', user.toMap(), where: 'id = ?', whereArgs: [user.id]);
  }

  //Delete a user

  Future<void> deleteRedacteur(int id) async {
    await _database.delete(
      'users',
      where: 'id = ?',
      whereArgs: [id],
    );
  }
}
