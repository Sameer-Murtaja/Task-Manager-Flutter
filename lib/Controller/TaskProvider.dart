import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_final/models/Task.dart';
import 'package:flutter_final/models/dbHelper.dart';

import '../models/Category.dart';

class TaskProvider extends ChangeNotifier {

  TaskProvider() {
    getAllTasks();
  }

  Task? currentTask;
  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();

setCurrentTask(Task task){
  currentTask = task;
  titleController.text = task.title??"";
  descriptionController.text = task.description??"";
  notifyListeners();
}

changeCurrentTaskCategory(int id){
  currentTask?.categoryId = id;
  // currentTask?.title = titleController.text;
  // currentTask?.description = descriptionController.text;
  notifyListeners();
}

changeCurrentTaskState(TaskState state){
  currentTask?.state = state;
  notifyListeners();
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

  addTask(String title, String description, {Category? category, TaskState? state}) async {
    Task task = Task(
      title: title,
      description: description,
      categoryId: category?.id,
      state: state?? TaskState.TODO
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
