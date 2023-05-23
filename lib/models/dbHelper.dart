import 'dart:developer';

import 'package:flutter_final/models/Task.dart';
import 'package:sqflite/sqflite.dart';

class DbHelper {
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();
  late Database database;
  initDatabase() async {
    String appPath = await getDatabasesPath();
    String dbPath = appPath + '/flutter_course.db';
    database = await openDatabase(dbPath, version: 3, onCreate: (db, v) {
      
      db.execute(
          'CREATE TABLE Categories (id INTEGER PRIMARY KEY AUTOINCREMENT, name TEXT)');

      db.execute('''
      CREATE TABLE Tasks (
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        title TEXT,
        description TEXT,
        categoryId INTEGER NULL,
        state TEXT,
        FOREIGN KEY (categoryId) REFERENCES Categories (id) 
      )''');
    });
  }

  addTask(Task task) async {
    try {
      int rowNumber = await database.insert('Tasks', task.toMap());
      log(rowNumber.toString());
    } catch (e) {
      log("row has not been inserted");
    }
  }

  Future<List<Task>> getAllTasks() async {
    await Future.delayed(const Duration(seconds: 3));
    List<Map> results = await database.query('Tasks');
    List<Task> tasks = results.map((e) => Task.fromMap(e)).toList();
    return tasks;
  }

  Future<Task> getTaskById(int id) async {
    List<Map> results = await database.query('Tasks', where: 'id=$id');
    return Task.fromMap(results.first);
  }

  deleteTask(int id) async {
    await database.delete('Tasks', where: 'id=$id');
  }

  updateTask(Task task) async {
    log("updating..");
    Map<String, Object?> newTask = task.toMap();
    newTask['id'] = task.id;
    log(newTask.toString());
    try {
    int x = await database.update('Tasks', newTask, where: "id='${task.id}'");
    log("rows affected $x");
    } catch (e) {
      log("$e row has not been updated");
    }
  }
}
