import 'dart:developer';

import 'package:flutter_final/models/Task.dart';
import 'package:sqflite/sqflite.dart';

import 'Category.dart';

class DbHelper {
  DbHelper._();
  static DbHelper dbHelper = DbHelper._();
  late Database database;
  initDatabase() async {
    String appPath = await getDatabasesPath();
    String dbPath = appPath + '/task_manager.db';
    database = await openDatabase(dbPath, version: 1, onCreate: (db, v) {
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

  deleteTask(int id) async {
    await database.delete('Tasks', where: 'id=$id');
  }

  updateTask(Task task) async {
    Map<String, Object?> newTask = task.toMap();
    newTask['id'] = task.id;
    try {
      await database.update('Tasks', newTask, where: "id='${task.id}'");
    } catch (e) {
      log("$e row has not been updated");
    }
  }

  addCategory(Category category) async {
    try {
      int rowNumber = await database.insert('Categories', category.toMap());
      log(rowNumber.toString());
    } catch (e) {
      log("Row has not been inserted");
    }
  }

  Future<List<Category>> getAllCategories() async {
    await Future.delayed(const Duration(seconds: 3));
    List<Map> results = await database.query('Categories');
    List<Category> categories =
        results.map((e) => Category.fromMap(e)).toList();
    return categories;
  }

  deleteCategory(int id) async {
    await database.delete('Categories', where: 'id=$id');
  }

  updateCategory(Category category) async {
    Map<String, Object?> newCategory = category.toMap();
    newCategory['id'] = category.id;
    try {
      await database.update('Categories', newCategory,
          where: "id='${category.id}'");
    } catch (e) {
      log("$e Row has not been updated");
    }
  }
}
