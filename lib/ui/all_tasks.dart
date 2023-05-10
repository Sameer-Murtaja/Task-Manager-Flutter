import 'package:flutter/material.dart';
import 'package:flutter_final/models/Category.dart';
import 'package:flutter_final/models/Task.dart';
import 'package:flutter_final/ui/items/item_task.dart';

import '../data/sample_data.dart';

class AllTasks extends StatefulWidget {
  TaskState? state;
  Category? category;
  late List<Task> tasks;

  AllTasks({this.state, this.category}){
    tasks = getTasks();
  }

  List<Task> getTasks() {
    List<Task> tasks = Data.tasks;
    if (state != null) tasks = tasks.where((element) => state == element.state).toList();
    if (category != null) tasks = tasks.where((element) => category == element.category).toList();
    return tasks;
  }

  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks>{

  refreshPage(){
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tasks")),
      backgroundColor: Color.fromRGBO(247, 247, 247, 10),
      body: ListView(
          children: widget.tasks
              .map((e) => Container(
                  margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: TaskItem(e,refreshPage)))
              .toList()),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF0059B3),
          foregroundColor: Colors.white,
          child: Icon(Icons.add_outlined),
          onPressed: () {}),
    );
  }
}
