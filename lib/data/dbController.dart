import 'package:flutter/material.dart';
import 'package:flutter_final/models/Task.dart';
import 'package:flutter_final/models/dbHelper.dart';

class DbController extends ChangeNotifier {
  DbController() {
    getAllTasks();
  }
  List<Task> tasks = [];
  bool isLoading = false;
  flipIsLoading() {
    isLoading = !isLoading;
    notifyListeners();
  }

  getAllTasks() async {
    flipIsLoading();
    tasks = await DbHelper.dbHelper.getAllTasks();
    flipIsLoading();
  }

  addTask(String title, String description) async {
    Task task = Task(
      title: title,
      description: description,
    );
    await DbHelper.dbHelper.addTask(task);
    getAllTasks();
  }

  updateTask(Task task) async {
    await DbHelper.dbHelper.updateTask(task);
    int taskIndex = tasks.indexWhere((t) => t.id == task.id);
    if(taskIndex != -1) tasks[taskIndex] = task ;
    notifyListeners();
  }

  deleteTask(int id) async {
    await DbHelper.dbHelper.deleteTask(id);
    tasks.removeWhere((element) => element.id == id);
    notifyListeners();
  }
}
