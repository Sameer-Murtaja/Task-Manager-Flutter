import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_final/ui/items/item_task.dart';

import '../data/sample_data.dart';

class AllTasks extends StatefulWidget {
  @override
  State<AllTasks> createState() => _AllTasksState();
}

class _AllTasksState extends State<AllTasks> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Tasks")),
      backgroundColor: Color.fromRGBO(247, 247, 247, 10),
      body: ListView(children: Data.tasks.map((e) => Container(margin: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: TaskItem(e))).toList()),
      floatingActionButton: FloatingActionButton(
          backgroundColor: Color(0xFF0059B3),
          foregroundColor: Colors.white,
          child: Icon(Icons.add_outlined),
          onPressed: () {}),
    );
  }
}
