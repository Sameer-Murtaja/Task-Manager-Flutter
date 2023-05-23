import 'package:flutter/material.dart';
import 'package:flutter_final/models/Category.dart';
import 'package:flutter_final/models/Task.dart';
import 'package:flutter_final/ui/add_task.dart';
import 'package:flutter_final/ui/items/item_task.dart';
import 'package:provider/provider.dart';

import '../data/dbController.dart';
import '../data/sample_data.dart';

class AllTasks extends StatefulWidget {
  TaskState? state;
  Category? category;

  AllTasks({this.state, this.category});


  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {

  List<Task> filterTasks(List<Task> tasks) {
    if (widget.state != null)
      tasks = tasks.where((element) => widget.state == element.state).toList();
    if (widget.category != null)
      tasks = tasks.where((element) => widget.category?.id == element.categoryId).toList();
    return tasks;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tasks")),
      backgroundColor: Color.fromRGBO(247, 247, 247, 10),
      body: Consumer<DbController>(builder: (context, pr, x) {
        return pr.isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : pr.tasks.isEmpty
                ? Center(child: Text("no tasks"))
                : ListView(
                    children: pr.tasks
                        .map((e) => Container(
                            margin: EdgeInsets.symmetric(
                                vertical: 8, horizontal: 16),
                            child: TaskItem(e)))
                        .toList());
      }),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF0059B3),
          foregroundColor: Colors.white,
          child: Icon(Icons.add_outlined),
          onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (c) => AddNewTask()));
          }),
    );
  }
}
