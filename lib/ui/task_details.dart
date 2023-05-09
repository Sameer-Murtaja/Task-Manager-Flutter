import 'package:flutter/material.dart';
import 'package:flutter_final/models/Task.dart';

import 'edit_task.dart';

class TaskDetails extends StatefulWidget{
  TaskDetails(Task task);
  @override
  State<TaskDetails> createState() => _TaskDetailsState();
}

class _TaskDetailsState extends State<TaskDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Task Details"),
        actions: [
          IconButton(onPressed: (){Navigator.of(context).push(MaterialPageRoute(builder: ( (context) => EditTask())));}, icon: Icon(Icons.edit))
        ],),
      body: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Text("Title", style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold)),
          SizedBox(height: 15,),
          Text("Description"),
        SizedBox(height: 20,),
        Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("Category: ",style: TextStyle(fontWeight: FontWeight.bold)),
            Text("none"),
            ]
        ),
        SizedBox(height: 20,),
          Row(crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            Text("State: ",style: TextStyle(fontWeight: FontWeight.bold)),
            Text("To do"),
          ],)
        ],),
      ),
    );
  }
}